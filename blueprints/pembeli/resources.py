from flask import Blueprint, request
from flask_restful import Resource, Api, reqparse, marshal
from . import *
from blueprints import db
from flask_jwt_extended import jwt_required
import json, requests
from flask_jwt_extended import create_access_token, \
    get_jwt_identity, jwt_required, get_jwt_claims
from ..penjual import Penjual_Produk_dbStructure
from sqlalchemy import update, desc
import memcache

bp_pembeli = Blueprint('bp_pembeli', __name__)
api = Api(bp_pembeli)

class Pembeli(Resource): 
    
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('pembeli_email', location='json', required=True)
        parser.add_argument('pembeli_password', location='json', required=True)
        parser.add_argument('pembeli_username', location='json', required=True)
        parser.add_argument('pembeli_namaLengkap', location='json', required=True)
        parser.add_argument('pembeli_gender', location='json', required=True)
        parser.add_argument('pembeli_lokasiKota', location='json', required=True)
        parser.add_argument('pembeli_pekerjaan', location='json', required=True)
        args = parser.parse_args()

        pembeli = Pembeli_dbStructure(None, args['pembeli_email'], args['pembeli_password']\
            , args['pembeli_username'], args['pembeli_namaLengkap'], args['pembeli_gender']\
            , args['pembeli_lokasiKota'], args['pembeli_pekerjaan'])

        db.session.add(pembeli)
        db.session.commit()
        return marshal(pembeli, Pembeli_dbStructure.response_field)

    @jwt_required
    def get(self, pembeli_username):
        user = get_jwt_identity()
        identity = marshal(user, Pembeli_dbStructure.response_field)

        if identity['pembeli_username'] == pembeli_username:
            qry = Pembeli_dbStructure.query
            # ini filter gan!
            qry = qry.filter_by(pembeli_username=pembeli_username)
            pembeliByUserName = marshal(qry[0], Pembeli_dbStructure.response_field)
            return pembeliByUserName, 200, {'Content-Type':'application/json'}
        else:
            return "WRONG CREDENTIAL!"

    @jwt_required
    def put(self, pembeli_id):
        user = get_jwt_identity()
        identity = marshal(user, Pembeli_dbStructure.response_field)

        if identity['pembeli_id'] == pembeli_id:
            parser = reqparse.RequestParser()
            parser.add_argument('pembeli_email', location='json', required=True)
            parser.add_argument('pembeli_password', location='json', required=True)
            parser.add_argument('pembeli_username', location='json', required=True)
            parser.add_argument('pembeli_namaLengkap', location='json', required=True)
            parser.add_argument('pembeli_gender', location='json', required=True)
            parser.add_argument('pembeli_lokasiKota', location='json', required=True)
            parser.add_argument('pembeli_pekerjaan', location='json', required=True)
            args = parser.parse_args()

            qry = Pembeli_dbStructure.query.get(pembeli_id)
            qry.pembeli_email = args['pembeli_email']
            qry.pembeli_password = args['pembeli_password']
            qry.pembeli_username = args['pembeli_username']
            qry.pembeli_namaLengkap = args['pembeli_namaLengkap']
            qry.pembeli_gender = args['pembeli_gender']
            qry.pembeli_lokasiKota = args['pembeli_lokasiKota']
            qry.pembeli_pekerjaan = args['pembeli_pekerjaan']
                    
            db.session.commit()
            return marshal(qry, Pembeli_dbStructure.response_field), 200, \
                {'Content-Type':'application/json'}
        else:
            return "WRONG CREDENTIAL!"


    @jwt_required
    def delete(self, pembeli_id=None):
        user = get_jwt_identity()
        identity = marshal(user, Pembeli_dbStructure.response_field)

        if identity['pembeli_id'] == pembeli_id:
            qry = Pembeli_dbStructure.query.get(pembeli_id)
            if qry is not None:
                db.session.delete(qry)
                db.session.commit()
                return marshal(qry, Pembeli_dbStructure.response_field), 200, \
                    {'Content-Type':'application/json'}
            return {'status' : 'NOT_FOUND'}, 404, {'Content-Type':'application/json'}
        else:
            return "WRONG CREDENTIAL!"

api.add_resource(Pembeli, '/pembeli/register', '/pembeli/<int:pembeli_id>', \
    '/pembeli/<string:pembeli_username>' )



############################### login ##########################################

class PembeliLogin(Resource):

    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('pembeli_username', location='json', required=True)
        parser.add_argument('pembeli_password', location='json', required=True)
        args = parser.parse_args()
        qry = Pembeli_dbStructure.query.filter_by(pembeli_username=args['pembeli_username'])\
            .filter_by(pembeli_password=args['pembeli_password']).first()

        if qry is not None:
            token = create_access_token(identity=marshal(qry, Pembeli_dbStructure.response_field))
            return {'token' : token}, 200
        else:
            return {'status':'UNAUTORIZED', 'message':'invalid key or secret'},401

api.add_resource(PembeliLogin, '/pembeli/login')

######################################### ini coba dari webpage
# class PembeliLogin(Resource):

#     def post(self):
#         parser = reqparse.RequestParser()
#         parser.add_argument('pembeli_username', location='args', required=True)
#         parser.add_argument('pembeli_password', location='args', required=True)
#         args = parser.parse_args()
#         qry = Pembeli_dbStructure.query.filter_by(pembeli_username=args['pembeli_username'])\
#             .filter_by(pembeli_password=args['pembeli_password']).first()

#         if qry is not None:
#             token = create_access_token(identity=marshal(qry, Pembeli_dbStructure.response_field))
#             return {'token' : token}, 200
#         else:
#             return {'status':'UNAUTORIZED', 'message':'invalid key or secret'},401

# api.add_resource(PembeliLogin, '/pembeli/login')


############################### items! ##########################################
class PembeliProduk(Resource):    

    def get(self, produk_id=None, produk_kategori=None, produk_subkategori = None):
        if produk_id == None and produk_kategori == None and produk_subkategori == None:
            parser = reqparse.RequestParser()
            parser.add_argument('p', type=int, location='args', default=1)
            parser.add_argument('rp', type=int, location='args', default=5)
            args = parser.parse_args()
            offset = (args['p'] * args['rp']) - args['rp']
            qry = Penjual_Produk_dbStructure.query
            LIST = []
            for row in qry.limit(args['rp']).offset(offset).all():
                penjualProduk_marshal = marshal(row, Penjual_Produk_dbStructure.response_field)
                penjualProduk_marshal['produk_hargaDiskon'] = penjualProduk_marshal['produk_harga']
                LIST.append(penjualProduk_marshal)
            return LIST, 200, {'Content-Type':'application/json'}
        elif produk_id != None and produk_kategori == None and produk_subkategori == None:
            qry = Penjual_Produk_dbStructure.query
            qry = qry.filter_by(produk_id=produk_id)
            userById = marshal(qry[0], Penjual_Produk_dbStructure.response_field)
            userById['produk_hargaDiskon'] = userById['produk_harga']
            return userById, 200, {'Content-Type':'application/json'}
        elif produk_id == None and produk_kategori != None:
            parser = reqparse.RequestParser()
            parser.add_argument('p', type=int, location='args', default=1)
            parser.add_argument('rp', type=int, location='args', default=5)
            args = parser.parse_args()
            offset = (args['p'] * args['rp']) - args['rp']
            qry = Penjual_Produk_dbStructure.query
            qry = qry.filter_by(produk_kategori=produk_kategori)
            if produk_subkategori != None:
                qry = qry.filter_by(produk_subkategori=produk_subkategori)
            LIST = []
            for row in qry.limit(args['rp']).offset(offset).all():
                userByCategory = marshal(row, Penjual_Produk_dbStructure.response_field)
                userByCategory['produk_hargaDiskon'] = userByCategory['produk_harga']
                LIST.append(userByCategory)
            return LIST, 200, {'Content-Type':'application/json'}
        else:
            return {'status':'URL warning', 'message':'Unrecognized URL'},401

    # # ini DI REACT
    # def post(self):
    #     parser = reqparse.RequestParser()
    #     parser.add_argument('produk_id', location='json', required=True)
    #     parser.add_argument('penjual_id', location='json', required=True)
    #     parser.add_argument('produk_nama', location='json', required=True)
    #     parser.add_argument('produk_harga', location='json', required=True)
    #     parser.add_argument('produk_deskripsi', location='json', required=True)
    #     parser.add_argument('produk_jumlahBeli', location='json', required=True)
    #     parser.add_argument('produk_statusPromo', location='json', required=True)
    #     parser.add_argument('produk_diskon', location='json', required=True)
    #     parser.add_argument('produk_hargaDiskon', location='json', required=True)
    #     parser.add_argument('produk_tanggalBeli', location='json', required=True)
    
    #     args = parser.parse_args()

    #     # ini cookienya diubah...
    #     username = request.cookies.get('YourSessionCookie')
    #     produkBeli = TransaksiPembeli_dbStructure(None, username, args['produk_id'], args['penjual_id']\
    #         , args['produk_nama'], args['produk_harga'], args['produk_deskripsi']\
    #         , args['produk_jumlahBeli'], args['produk_statusPromo']\
    #         , args['produk_diskon']\
    #         , int(args['produk_harga']) - (int(args['produk_harga']) * (int(args['produk_diskon'])/10))\
    #         , args['produk_tanggalBeli'])

    #     # find the item and reduce the stock
    #     qry = Penjual_Produk_dbStructure.query
    #     qry = qry.filter_by(produk_id=args['produk_id'])
    #     # stok tidak cukup
    #     if qry[0].produk_stok-int(args['produk_jumlahBeli']) > 0:
    #         qry = qry.update({"produk_stok" : qry[0].produk_stok - int(args['produk_jumlahBeli'])})
    #     else:
    #         return "Jumlah yang anda akan beli melebihi stok, masukkan angka pembelian yang sesuai."

    #     db.session.commit()
    #     return marshal(produkBeli, TransaksiPembeli_dbStructure.response_field)


api.add_resource(PembeliProduk, '/pembeli/produk', '/pembeli/produk/<int:produk_id>'
    , '/pembeli/produk/<string:produk_kategori>')



####### Promo #######
 ##########################################################################
# class MemcacheUy(Resource):
#     def get(self):
#         client = memcache.Client([('127.0.0.1', 11211)])
#         return client.get("sample_user")

# api.add_resource(MemcacheUy, '/pembeli/produk/memcache')
 ##########################################################################

class PembeliProdukPromo(Resource):    
    @jwt_required
    def get(self, pembeli_username, produk_id=None, produk_kategori=None, produk_subkategori=None):
        user = get_jwt_identity()
        identity = marshal(user, Pembeli_dbStructure.response_field)

        if identity['pembeli_username'] == pembeli_username:
            if produk_id == None and produk_kategori == None:
                client = memcache.Client([('127.0.0.1', 11211)])
                isiMem = client.get("getAllMem")
                if isiMem == None:
                    parser = reqparse.RequestParser()
                    parser.add_argument('p', type=int, location='args', default=1)
                    parser.add_argument('rp', type=int, location='args', default=200)
                    args = parser.parse_args()
                    offset = (args['p'] * args['rp']) - args['rp']
                    qry = Penjual_Produk_dbStructure.query
                    LIST = []
                    for row in qry.limit(args['rp']).offset(offset).all():
                        penjualProduk_marshal = marshal(row, Penjual_Produk_dbStructure.response_field)
                        # penjualProduk_marshal['produk_hargaDiskon'] = penjualProduk_marshal['produk_harga']
                        LIST.append(penjualProduk_marshal)
                    
                    ############################### save to ###################################
                    # client = memcache.Client([('127.0.0.1', 11211)])
                    sample_obj = LIST 
                    client.set("getAllMem", sample_obj, time=15)
                    ##########################################################################
                    return LIST, 200, {'Content-Type':'application/json'}
                else:
                    return isiMem
                
            elif produk_id != None and produk_kategori == None and produk_subkategori ==None:
                client = memcache.Client([('127.0.0.1', 11211)])
                isiMem = client.get("getByIDMem")
                if isiMem == None:
                    qry = Penjual_Produk_dbStructure.query
                    qry = qry.filter_by(produk_id=produk_id)
                    userById = marshal(qry[0], Penjual_Produk_dbStructure.response_field)
                    
                    ############################### save to ###################################
                    # client = memcache.Client([('127.0.0.1', 11211)])
                    sample_obj = userById 
                    client.set("getByIDMem", sample_obj, time=15)
                    ##########################################################################

                    return userById, 200, {'Content-Type':'application/json'}
                else:
                    return isiMem

            elif produk_id == None and produk_kategori != None:
                client = memcache.Client([('127.0.0.1', 11211)])
                isiMem = client.get("getByCategoryMem")
                if isiMem == None:
                    parser = reqparse.RequestParser()
                    parser.add_argument('p', type=int, location='args', default=1)
                    parser.add_argument('rp', type=int, location='args', default=5)
                    args = parser.parse_args()
                    offset = (args['p'] * args['rp']) - args['rp']
                    qry = Penjual_Produk_dbStructure.query
                    qry = qry.filter_by(produk_kategori=produk_kategori)
                    if produk_subkategori != None:
                        qry = qry.filter_by(produk_subkategori=produk_subkategori)
                    LIST = []
                    for row in qry.limit(args['rp']).offset(offset).all():
                        userByCategory = marshal(row, Penjual_Produk_dbStructure.response_field)
                        # userByCategory['produk_hargaDiskon'] = userByCategory['produk_harga']
                        LIST.append(userByCategory)

                    ############################### save to ###################################
                    # client = memcache.Client([('127.0.0.1', 11211)])
                    sample_obj = LIST 
                    client.set("getByCategoryMem", sample_obj, time=15)
                    ##########################################################################

                    return LIST, 200, {'Content-Type':'application/json'}
                else:
                    return isiMem
            else:
                return {'status':'URL warning', 'message':'Unrecognized URL'},401
        else:
            return "WRONG CREDENTIAL!"

    @jwt_required
    def post(self, pembeli_username):
        user = get_jwt_identity()
        identity = marshal(user, Pembeli_dbStructure.response_field)

        if identity['pembeli_username'] == pembeli_username:
            parser = reqparse.RequestParser()
            # parser.add_argument('pembeli_username', location='json', required=True)
            parser.add_argument('produk_id', location='json', required=True)
            parser.add_argument('penjual_id', location='json', required=True)
            parser.add_argument('produk_nama', location='json', required=True)
            parser.add_argument('produk_harga', location='json', required=True)
            parser.add_argument('produk_deskripsi', location='json', required=True)
            parser.add_argument('produk_jumlahBeli', location='json', required=True)
            parser.add_argument('produk_statusPromo', location='json', required=True)
            parser.add_argument('produk_diskon', location='json', required=True)
            parser.add_argument('produk_hargaDiskon', location='json', required=True)
            parser.add_argument('produk_tanggalBeli', location='json', required=True)
            parser.add_argument('transaksi_status', location='json', required=True)

            args = parser.parse_args()

            calc_produkDiskon = int(args['produk_harga']) - (int(args['produk_harga']) * (int(args['produk_diskon'])/10))
            calc_produkHargaBayar = calc_produkDiskon * int(args['produk_jumlahBeli'])

            produkBeli = TransaksiPembeli_dbStructure(None, pembeli_username, args['produk_id'], args['penjual_id']\
                , args['produk_nama'], args['produk_harga'], args['produk_deskripsi']\
                , args['produk_jumlahBeli'], args['produk_statusPromo']\
                , args['produk_diskon'], calc_produkDiskon\
                , args['produk_tanggalBeli'], args['transaksi_status'], calc_produkHargaBayar)

            # find the item and reduce the stock, add the jumlahpembelian
            qry = Penjual_Produk_dbStructure.query
            qry = qry.filter_by(produk_id=args['produk_id'])
            # stok tidak cukup
            if qry[0].produk_stok-int(args['produk_jumlahBeli']) > 0:
                qry = qry.update({"produk_Jumlahdibeli" : qry[0].produk_Jumlahdibeli + int(args['produk_jumlahBeli'])\
                    , "produk_stok" : qry[0].produk_stok - int(args['produk_jumlahBeli'])})
            else:
                return "Jumlah yang anda akan beli melebihi stok, masukkan angka pembelian yang sesuai."

            db.session.add(produkBeli)
            db.session.commit() # NOT HEREEEEE, karena baru masuk transaksi, coba lagi!!!!! TransaksiPembeli_dbStructure ini table transaksi
            return marshal(produkBeli, TransaksiPembeli_dbStructure.response_field)
        else:
            return "WRONG CREDENTIAL!"


api.add_resource(PembeliProdukPromo, '/pembeli/produkAll/<string:pembeli_username>'\
    , '/pembeli/produkAll/<string:pembeli_username>/<int:produk_id>'
    , '/pembeli/produkAll/<string:pembeli_username>/<string:produk_kategori>'
    , '/pembeli/produkAll/beli/<string:pembeli_username>')


############################### transaksi! ##########################################
class PembeliTransaksi(Resource): 
    @jwt_required
    def get(self, pembeli_username):
        user = get_jwt_identity()
        identity = marshal(user, Pembeli_dbStructure.response_field)

        if identity['pembeli_username'] == pembeli_username:
            parser = reqparse.RequestParser()
            parser.add_argument('p', type=int, location='args', default=1)
            parser.add_argument('rp', type=int, location='args', default=5)
            args = parser.parse_args()
            offset = (args['p'] * args['rp']) - args['rp']
            qry = TransaksiPembeli_dbStructure.query
            qry = qry.filter_by(pembeli_username=pembeli_username)
            LIST = []
            for row in qry.limit(args['rp']).offset(offset).all():
                dataCart = marshal(row, TransaksiPembeli_dbStructure.response_field)
                LIST.append(dataCart)
            return LIST, 200, {'Content-Type':'application/json'}
        else:
            return "WRONG CREDENTIAL!"

api.add_resource(PembeliTransaksi, '/pembeli/transaksi/<string:pembeli_username>')

############################### filter, ini cart ##########################################
############################### bayar ##########################################
############################### ubah status get ##########################################
############################### commit ##########################################
class PembeliCart(Resource): 
    @jwt_required
    def get(self, pembeli_username):
        user = get_jwt_identity()
        identity = marshal(user, Pembeli_dbStructure.response_field)

        if identity['pembeli_username'] == pembeli_username:
            parser = reqparse.RequestParser()
            parser.add_argument('p', type=int, location='args', default=1)
            parser.add_argument('rp', type=int, location='args', default=5)
            args = parser.parse_args()
            offset = (args['p'] * args['rp']) - args['rp']
            qry = TransaksiPembeli_dbStructure.query
            qry = qry.filter_by(pembeli_username=pembeli_username)
            qry = qry.filter_by(transaksi_status="true")
            LIST = []
            totalBayar = 0
            totalProduk = 0
            for row in qry.limit(args['rp']).offset(offset).all():
                dataCart = marshal(row, TransaksiPembeli_dbStructure.response_field)
                LIST.append(dataCart)
                totalProduk = totalProduk + dataCart['produk_jumlahBeli']
                totalBayar = totalBayar + dataCart['produk_hargaBayar']
            LIST.append("Total Produk dibeli: %d" % totalProduk)
            LIST.append("Total Bayar: %d" % totalBayar)
            return LIST, 200, {'Content-Type':'application/json'}
        else:
            return "WRONG CREDENTIAL!"
    

    @jwt_required
    def post(self, pembeli_username):
        user = get_jwt_identity()
        identity = marshal(user, Pembeli_dbStructure.response_field)

        if identity['pembeli_username'] == pembeli_username:
            parser = reqparse.RequestParser()
            parser.add_argument('p', type=int, location='args', default=1)
            parser.add_argument('rp', type=int, location='args', default=5)
            args = parser.parse_args()
            offset = (args['p'] * args['rp']) - args['rp']

            qry = TransaksiPembeli_dbStructure.query
            qry = qry.filter_by(pembeli_username=pembeli_username)
            qry = qry.filter_by(transaksi_status="true")
            
            totalBayar = 0
            totalProduk = 0
            for row in qry.all():
                dataCart = marshal(row, TransaksiPembeli_dbStructure.response_field)
                totalProduk = totalProduk + dataCart['produk_jumlahBeli']
                totalBayar = totalBayar + dataCart['produk_hargaBayar']
            qry = qry.update({"transaksi_status" : "false"})
            db.session.commit()


            return totalBayar, 200, {'Content-Type':'application/json'}
        else:
            return "WRONG CREDENTIAL!"

api.add_resource(PembeliCart, '/pembeli/cart/<string:pembeli_username>'\
    ,  '/pembeli/cart/bayar/<string:pembeli_username>')


### Popular ###
class PembeliProdukPopular(Resource):    
    @jwt_required
    def get(self, pembeli_username, produk_kategori=None, produk_subkategori=None):
        user = get_jwt_identity()
        identity = marshal(user, Pembeli_dbStructure.response_field)

        if identity['pembeli_username'] == pembeli_username:
            if produk_kategori == None:
                client = memcache.Client([('127.0.0.1', 11211)])
                isiMem = client.get("getAllPopMem")
                if isiMem == None:
                    parser = reqparse.RequestParser()
                    parser.add_argument('p', type=int, location='args', default=1)
                    parser.add_argument('rp', type=int, location='args', default=5)
                    args = parser.parse_args()
                    offset = (args['p'] * args['rp']) - args['rp']
                    qry = Penjual_Produk_dbStructure.query
                    qry = qry.order_by(desc("produk_Jumlahdibeli"))
                    LIST = []
                    for row in qry.limit(args['rp']).offset(offset).all():
                        penjualProduk_marshal = marshal(row, Penjual_Produk_dbStructure.response_field)
                        LIST.append(penjualProduk_marshal)

                    ############################### save to ###################################
                    # client = memcache.Client([('127.0.0.1', 11211)])
                    sample_obj = LIST 
                    client.set("getAllPopMem", sample_obj, time=15)
                    ##########################################################################

                    return LIST, 200, {'Content-Type':'application/json'}
                else: 
                    return isiMem


            elif produk_kategori != None and produk_subkategori ==None:
                client = memcache.Client([('127.0.0.1', 11211)])
                isiMem = client.get("getAllPopCatMem")
                if isiMem == None:
                    parser = reqparse.RequestParser()
                    parser.add_argument('p', type=int, location='args', default=1)
                    parser.add_argument('rp', type=int, location='args', default=5)
                    args = parser.parse_args()
                    offset = (args['p'] * args['rp']) - args['rp']
                    qry = Penjual_Produk_dbStructure.query
                    qry = qry.filter_by(produk_kategori=produk_kategori)
                    qry = qry.order_by(desc("produk_Jumlahdibeli"))
                    LIST = []
                    for row in qry.limit(args['rp']).offset(offset).all():
                        penjualProduk_marshal = marshal(row, Penjual_Produk_dbStructure.response_field)
                        LIST.append(penjualProduk_marshal)
                    ############################### save to ###################################
                    # client = memcache.Client([('127.0.0.1', 11211)])
                    sample_obj = LIST 
                    client.set("getAllPopCatMem", sample_obj, time=15)
                    ##########################################################################
                    return LIST, 200, {'Content-Type':'application/json'}
                else:
                    return isiMem

            elif produk_kategori != None and produk_subkategori !=None:
                client = memcache.Client([('127.0.0.1', 11211)])
                isiMem = client.get("getAllPopCatSubMem")
                if isiMem == None:
                    parser = reqparse.RequestParser()
                    parser.add_argument('p', type=int, location='args', default=1)
                    parser.add_argument('rp', type=int, location='args', default=5)
                    args = parser.parse_args()
                    offset = (args['p'] * args['rp']) - args['rp']
                    qry = Penjual_Produk_dbStructure.query
                    qry = qry.filter_by(produk_kategori=produk_kategori)
                    qry = qry.filter_by(produk_subkategori=produk_subkategori)
                    qry = qry.order_by(desc("produk_Jumlahdibeli"))
                    LIST = []
                    for row in qry.limit(args['rp']).offset(offset).all():
                        userByCategory = marshal(row, Penjual_Produk_dbStructure.response_field)
                        # userByCategory['produk_hargaDiskon'] = userByCategory['produk_harga']
                        LIST.append(userByCategory)
                        
                    ############################### save to ###################################
                    # client = memcache.Client([('127.0.0.1', 11211)])
                    sample_obj = LIST 
                    client.set("getAllPopCatSubMem", sample_obj, time=15)
                    ##########################################################################
                    return LIST, 200, {'Content-Type':'application/json'}
                else:
                    return isiMem
            else:
                return {'status':'URL warning', 'message':'Unrecognized URL'},401


        else:
            return "WRONG CREDENTIAL!"

api.add_resource(PembeliProdukPopular, '/pembeli/produkAll/popular/<string:pembeli_username>'\
    , '/pembeli/produkAll/popular/<string:pembeli_username>/<string:produk_kategori>'
    , '/pembeli/produkAll/popular/<string:pembeli_username>/<string:produk_kategori>/<string:produk_subkategori>')


class PembeliProdukSearch(Resource):    
    @jwt_required
    def get(self, pembeli_username, produk_kategori=None):
        user = get_jwt_identity()
        identity = marshal(user, Pembeli_dbStructure.response_field)

        if identity['pembeli_username'] == pembeli_username:
            if produk_kategori == None:
                parser = reqparse.RequestParser()
                parser.add_argument('p', type=int, location='args', default=1)
                parser.add_argument('rp', type=int, location='args', default=5)
                parser.add_argument('keyword', location='args')
                args = parser.parse_args()
                offset = (args['p'] * args['rp']) - args['rp']
                qry = Penjual_Produk_dbStructure.query
                qry = qry.filter(Penjual_Produk_dbStructure.produk_nama.like("%"+args['keyword']+"%"))

                LIST = []
                for row in qry.limit(args['rp']).offset(offset).all():
                    penjualProduk_marshal = marshal(row, Penjual_Produk_dbStructure.response_field)
                    LIST.append(penjualProduk_marshal)
                return LIST, 200, {'Content-Type':'application/json'}
            
            
            elif produk_kategori != None:
                parser = reqparse.RequestParser()
                parser.add_argument('p', type=int, location='args', default=1)
                parser.add_argument('rp', type=int, location='args', default=5)
                parser.add_argument('keyword', location='args')
                args = parser.parse_args()
                offset = (args['p'] * args['rp']) - args['rp']
                qry = Penjual_Produk_dbStructure.query
                qry = qry.filter_by(produk_kategori=produk_kategori)
                qry = qry.filter(Penjual_Produk_dbStructure.produk_nama.like("%"+args['keyword']+"%"))

                LIST = []
                for row in qry.limit(args['rp']).offset(offset).all():
                    penjualProduk_marshal = marshal(row, Penjual_Produk_dbStructure.response_field)
                    LIST.append(penjualProduk_marshal)
                return LIST, 200, {'Content-Type':'application/json'}
            else:
                return {'status':'URL warning', 'message':'Unrecognized URL'},401
        else:
            return "WRONG CREDENTIAL!"


api.add_resource(PembeliProdukSearch, '/pembeli/produkAll/search/<string:pembeli_username>'\
    , '/pembeli/produkAll/search/<string:pembeli_username>/<string:produk_kategori>')


class PembeliProdukSearchNot(Resource):    
 
    def get(self, produk_kategori=None):
       
        if produk_kategori == None:
            parser = reqparse.RequestParser()
            parser.add_argument('p', type=int, location='args', default=1)
            parser.add_argument('rp', type=int, location='args', default=25)
            parser.add_argument('keyword', location='args')
            args = parser.parse_args()
            offset = (args['p'] * args['rp']) - args['rp']
            qry = Penjual_Produk_dbStructure.query
            qry = qry.filter(Penjual_Produk_dbStructure.produk_nama.like("%"+args['keyword']+"%"))

            LIST = []
            for row in qry.limit(args['rp']).offset(offset).all():
                penjualProduk_marshal = marshal(row, Penjual_Produk_dbStructure.response_field)
                penjualProduk_marshal['produk_hargaDiskon'] = penjualProduk_marshal['produk_harga']
                LIST.append(penjualProduk_marshal)
            return LIST, 200, {'Content-Type':'application/json'}
        

        elif produk_kategori != None:
            parser = reqparse.RequestParser()
            parser.add_argument('p', type=int, location='args', default=1)
            parser.add_argument('rp', type=int, location='args', default=5)
            parser.add_argument('keyword', location='args')
            args = parser.parse_args()
            offset = (args['p'] * args['rp']) - args['rp']
            qry = Penjual_Produk_dbStructure.query
            qry = qry.filter_by(produk_kategori=produk_kategori)
            qry = qry.filter(Penjual_Produk_dbStructure.produk_nama.like("%"+args['keyword']+"%"))

            LIST = []
            for row in qry.limit(args['rp']).offset(offset).all():
                penjualProduk_marshal = marshal(row, Penjual_Produk_dbStructure.response_field)
                penjualProduk_marshal['produk_hargaDiskon'] = penjualProduk_marshal['produk_harga']
                LIST.append(penjualProduk_marshal)
            return LIST, 200, {'Content-Type':'application/json'}
        else:
            return {'status':'URL warning', 'message':'Unrecognized URL'},401
       


api.add_resource(PembeliProdukSearchNot, '/pembeli/produk/search'\
    , '/pembeli/produk/search/<string:produk_kategori>')