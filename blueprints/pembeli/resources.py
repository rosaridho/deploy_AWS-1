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
# import memcache

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
        parser.add_argument('pembeli_avatar', location='json', required=True)
        args = parser.parse_args()

        pembeli = Pembeli_dbStructure(None, args['pembeli_email'], args['pembeli_password']\
            , args['pembeli_username'], args['pembeli_namaLengkap'], args['pembeli_gender']\
            , args['pembeli_lokasiKota'], args['pembeli_pekerjaan'],  args['pembeli_avatar'])

        db.session.add(pembeli)
        db.session.commit()
        DataPost = marshal(pembeli, Pembeli_dbStructure.response_field)
        DICT={"Status":"OK", "Message":"Pembeli melakukan registrasi", "Data_Pembeli":DataPost}
        return DICT, 200, {'Content-Type':'application/json'}

# ====================================================================
    @jwt_required
    def get(self, pembeli_username):
        user = get_jwt_identity()
        identity = marshal(user, Pembeli_dbStructure.response_field)

        if identity['pembeli_username'] == pembeli_username:
            qry = Pembeli_dbStructure.query
            qry = qry.filter_by(pembeli_username=pembeli_username)
            pembeliByUserName = marshal(qry[0], Pembeli_dbStructure.response_field)
            DICT={"Status":"OK", "Message":"Pembeli melihat profile", "Data_Pembeli":pembeliByUserName}
            return DICT, 200, {'Content-Type':'application/json'}
        else:
            return {'status':'WRONG CREDENTIAL!', 'message':'Anda tidak memiliki wewenang.'},401
    

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
            parser.add_argument('pembeli_avatar', location='json', required=True)
            args = parser.parse_args()

            qry = Pembeli_dbStructure.query.get(pembeli_id)
            qry.pembeli_email = args['pembeli_email']
            qry.pembeli_password = args['pembeli_password']
            qry.pembeli_username = args['pembeli_username']
            qry.pembeli_namaLengkap = args['pembeli_namaLengkap']
            qry.pembeli_gender = args['pembeli_gender']
            qry.pembeli_lokasiKota = args['pembeli_lokasiKota']
            qry.pembeli_pekerjaan = args['pembeli_pekerjaan']
            qry.pembeli_pekerjaan = args['pembeli_avatar']
                    
            db.session.commit()
            DataEdit = marshal(qry, Pembeli_dbStructure.response_field)
            DICT={"Status":"OK", "Message":"Pembeli merubah profile", "Data_Pembeli":DataEdit}
            return DICT, 200, {'Content-Type':'application/json'}
        else:
            return {'status':'WRONG CREDENTIAL!', 'message':'Anda tidak memiliki wewenang.'},401



    @jwt_required
    def delete(self, pembeli_id=None):
        user = get_jwt_identity()
        identity = marshal(user, Pembeli_dbStructure.response_field)

        if identity['pembeli_id'] == pembeli_id:
            qry = Pembeli_dbStructure.query.get(pembeli_id)
            if qry is not None:
                db.session.delete(qry)
                db.session.commit()
                DataDelete = marshal(qry, Pembeli_dbStructure.response_field)
                DICT={"Status":"OK", "Message":"Pembeli menghapus profile", "Data_Pembeli":DataDelete}
                return DICT, 200, {'Content-Type':'application/json'}
                
            return {'status' : 'NOT_FOUND'}, 404, {'Content-Type':'application/json'}
        else:
            return {'status':'WRONG CREDENTIAL!', 'message':'Anda tidak memiliki wewenang.'},401

    def options(self, pembeli_username):
        DICT={"Status":"OK", "Message":"Pembeli melakukan registrasi", "Data_Pembeli":"OK Banget"}
        return DICT, 200, {'Content-Type':'application/json'}

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
            DICT={"Status":"OK", "Message":"Pembeli Melakukan login", "Token":token}
            return DICT, 201, {'Content-Type':'application/json'}
           
        else:
            DICT={'status':'UNAUTORIZED', 'message':'invalid key or secret'}
            return DICT, 401, {'Content-Type':'application/json'}

    def options(self):
        DICT={"Status":"OK", "Message":"Pembeli melakukan registrasi", "Data_Pembeli":"OK Banget"}
        return DICT, 200, {'Content-Type':'application/json'}

api.add_resource(PembeliLogin, '/pembeli/login')




############################### produk! ##########################################
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
            DICT={"Status":"OK", "Message":"Pembeli Melihat Seluruh Produk", "Produk":LIST}
            return DICT, 200, {'Content-Type':'application/json'}
        elif produk_id != None and produk_kategori == None and produk_subkategori == None:
            qry = Penjual_Produk_dbStructure.query
            qry = qry.filter_by(produk_id=produk_id)
            userById = marshal(qry[0], Penjual_Produk_dbStructure.response_field)
            userById['produk_hargaDiskon'] = userById['produk_harga']
            DICT={"Status":"OK", "Message":"Pembeli Melihat Produk berdasarkan ID", "Produk":userById}
            return DICT, 200, {'Content-Type':'application/json'}
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
            DICT={"Status":"OK", "Message":"Pembeli Melihat Produk berdasarkan Kategori: "+produk_kategori, "Produk":LIST}
            return DICT, 200, {'Content-Type':'application/json'}
        elif produk_id == None and produk_kategori != None:
            parser = reqparse.RequestParser()
            parser.add_argument('p', type=int, location='args', default=1)
            parser.add_argument('rp', type=int, location='args', default=5)
            args = parser.parse_args()
            offset = (args['p'] * args['rp']) - args['rp']
            qry = Penjual_Produk_dbStructure.query
            qry = qry.filter_by(produk_kategori=produk_kategori)
            qry = qry.filter_by(produk_subkategori=produk_subkategori)
            if produk_subkategori != None:
                qry = qry.filter_by(produk_subkategori=produk_subkategori)
            LIST = []
            for row in qry.limit(args['rp']).offset(offset).all():
                userByCategory = marshal(row, Penjual_Produk_dbStructure.response_field)
                userByCategory['produk_hargaDiskon'] = userByCategory['produk_harga']
                LIST.append(userByCategory)
            DICT={"Status":"OK", "Message":"Pembeli Melihat Produk berdasarkan Kategori: "+produk_kategori, "Produk":LIST}
            return DICT, 200, {'Content-Type':'application/json'}
        else: 
            return {'status':'URL warning', 'message':'Unrecognized URL'},401
 
    def options(self, produk_id=None, produk_kategori=None, produk_subkategori = None):
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
            DICT={"Status":"OK", "Message":"Pembeli Melihat Seluruh Produk", "Produk":LIST}
            return DICT, 200, {'Content-Type':'application/json'}
        elif produk_id != None and produk_kategori == None and produk_subkategori == None:
            qry = Penjual_Produk_dbStructure.query
            qry = qry.filter_by(produk_id=produk_id)
            userById = marshal(qry[0], Penjual_Produk_dbStructure.response_field)
            userById['produk_hargaDiskon'] = userById['produk_harga']
            DICT={"Status":"OK", "Message":"Pembeli Melihat Produk berdasarkan ID", "Produk":userById}
            return DICT, 200, {'Content-Type':'application/json'}
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
            DICT={"Status":"OK", "Message":"Pembeli Melihat Produk berdasarkan Kategori: "+produk_kategori, "Produk":LIST}
            return DICT, 200, {'Content-Type':'application/json'}
        elif produk_id == None and produk_kategori != None:
            parser = reqparse.RequestParser()
            parser.add_argument('p', type=int, location='args', default=1)
            parser.add_argument('rp', type=int, location='args', default=5)
            args = parser.parse_args()
            offset = (args['p'] * args['rp']) - args['rp']
            qry = Penjual_Produk_dbStructure.query
            qry = qry.filter_by(produk_kategori=produk_kategori)
            qry = qry.filter_by(produk_subkategori=produk_subkategori)
            if produk_subkategori != None:
                qry = qry.filter_by(produk_subkategori=produk_subkategori)
            LIST = []
            for row in qry.limit(args['rp']).offset(offset).all():
                userByCategory = marshal(row, Penjual_Produk_dbStructure.response_field)
                userByCategory['produk_hargaDiskon'] = userByCategory['produk_harga']
                LIST.append(userByCategory)
            DICT={"Status":"OK", "Message":"Pembeli Melihat Produk berdasarkan Kategori: "+produk_kategori, "Produk":LIST}
            return DICT, 200, {'Content-Type':'application/json'}
        else: 
            return {'status':'URL warning', 'message':'Unrecognized URL'},401

api.add_resource(PembeliProduk, '/pembeli/produk', '/pembeli/produk/<int:produk_id>'
    , '/pembeli/produk/<string:produk_kategori>'
    , '/pembeli/produk/<string:produk_kategori>/<string:produk_subkategori>')

 

####### Promo #######

class PembeliProdukPromo(Resource):    
    @jwt_required
    def get(self, pembeli_username, produk_id=None, produk_kategori=None, produk_subkategori=None):
        user = get_jwt_identity()
        identity = marshal(user, Pembeli_dbStructure.response_field)

        if identity['pembeli_username'] == pembeli_username:
            if produk_id == None and produk_kategori == None:
                # client = memcache.Client([('127.0.0.1', 11211)])
                # isiMem = client.get("getAllMem")
                isiMem = None
                if isiMem == None:
                    parser = reqparse.RequestParser()
                    parser.add_argument('p', type=int, location='args', default=1)
                    parser.add_argument('rp', type=int, location='args', default=50)
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
                    # sample_obj = LIST 
                    # client.set("getAllMem", sample_obj, time=15)
                    ##########################################################################
                    DICT={"Status":"OK", "Message":"Pembeli Teregister Melihat Seluruh Produk (DB):", "Produk":LIST}
                    return DICT, 200, {'Content-Type':'application/json'}
                else:
                    DICT={"Status":"OK", "Message":"Pembeli Teregister Melihat Seluruh Produk (MEM):", "Produk":isiMem}
                    return DICT, 200, {'Content-Type':'application/json'}
        
                
            elif produk_id != None and produk_kategori == None and produk_subkategori ==None:
                # client = memcache.Client([('127.0.0.1', 11211)])
                # isiMem = client.get("getByIDMem")
                isiMem = None
                if isiMem == None:
                    qry = Penjual_Produk_dbStructure.query
                    qry = qry.filter_by(produk_id=produk_id)
                    userById = marshal(qry[0], Penjual_Produk_dbStructure.response_field)
                    
                    ############################### save to ###################################
                    # client = memcache.Client([('127.0.0.1', 11211)])
                    # sample_obj = userById 
                    # client.set("getByIDMem", sample_obj, time=15)
                    ##########################################################################

                    DICT={"Status":"OK", "Message":"Pembeli Teregister Melihat Produk berdasarkan ID (DB):", "Produk":userById}
                    return DICT, 200, {'Content-Type':'application/json'}
                else:
                    DICT={"Status":"OK", "Message":"Pembeli Teregister Melihat Produk berdasarkan ID (MEM):", "Produk":isiMem}
                    return DICT, 200, {'Content-Type':'application/json'}


            elif produk_id == None and produk_kategori != None:
                # client = memcache.Client([('127.0.0.1', 11211)])
                # isiMem = client.get("getByCategoryMem")
                isiMem = None
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
                    # sample_obj = LIST 
                    # client.set("getByCategoryMem", sample_obj, time=15)
                    ##########################################################################

                    DICT={"Status":"OK", "Message":"Pembeli Teregister Melihat Produk berdasarkan Kategori (DB):", "Produk":LIST}
                    return DICT, 200, {'Content-Type':'application/json'}
                else:
                    DICT={"Status":"OK", "Message":"Pembeli Teregister Melihat Produk berdasarkan Kategori (MEM):", "Produk":isiMem}
                    return DICT, 200, {'Content-Type':'application/json'}
            else:
                return {'status':'URL warning', 'message':'Unrecognized URL'},401
        else:
            return {'status':'WRONG CREDENTIAL!', 'message':'Anda tidak memiliki wewenang.'},401


############################### transaksi! ##########################################

    @jwt_required
    def post(self, pembeli_username):
        user = get_jwt_identity()
        identity = marshal(user, Pembeli_dbStructure.response_field)

        if identity['pembeli_username'] == pembeli_username:
            parser = reqparse.RequestParser()
            parser.add_argument('produk_id', location='json', required=True)
            parser.add_argument('produk_jumlahBeli', location='json', required=True)
            parser.add_argument('produk_tanggalBeli', location='json', required=True)
            parser.add_argument('transaksi_status', location='json', required=True)

            args = parser.parse_args()

            # find the item and reduce the stock, add jumlah pembelian dan data lainnya yang sudah tersedia
            qry = Penjual_Produk_dbStructure.query
            qry = qry.filter_by(produk_id=args['produk_id'])

            produkGambar = qry[0].produk_gambar
            calc_produkDiskon = qry[0].produk_hargaDiskon
            calc_produkHargaBayar = calc_produkDiskon * int(args['produk_jumlahBeli'])

            produkBeli = TransaksiPembeli_dbStructure(None, pembeli_username, qry[0].produk_id, qry[0].penjual_id\
                , qry[0].produk_nama, qry[0].produk_harga, qry[0].produk_deskripsi\
                , args['produk_jumlahBeli'], qry[0].produk_statusPromo\
                , qry[0].produk_diskon, calc_produkDiskon\
                , args['produk_tanggalBeli'], args['transaksi_status'], calc_produkHargaBayar,produkGambar)


            # stok tidak cukup
            if qry[0].produk_stok-int(args['produk_jumlahBeli']) > 0:
                qry = qry.update({"produk_Jumlahdibeli" : qry[0].produk_Jumlahdibeli + int(args['produk_jumlahBeli'])\
                    , "produk_stok" : qry[0].produk_stok - int(args['produk_jumlahBeli'])})
            else:
                return "Jumlah yang anda akan beli melebihi stok, masukkan angka pembelian yang sesuai."

            db.session.add(produkBeli)
            db.session.commit() # NOT HEREEEEE, karena baru masuk transaksi, coba lagi!!!!! TransaksiPembeli_dbStructure ini table transaksi
            DataBeli = marshal(produkBeli, TransaksiPembeli_dbStructure.response_field)
            DICT={"Status":"OK", "Message":"Pembeli membeli produk:", "Produk":DataBeli}
            return DICT, 200, {'Content-Type':'application/json'}
        else:
            return {'status':'WRONG CREDENTIAL!', 'message':'Anda tidak memiliki wewenang.'},401

    def options(self, pembeli_username):
        DICT={"Status":"OK", "Message":"Pembeli melakukan registrasi", "Data_Pembeli":"OK Banget"}
        return DICT, 200, {'Content-Type':'application/json'}

api.add_resource(PembeliProdukPromo, '/pembeli/produkAll/<string:pembeli_username>'\
    , '/pembeli/produkAll/<string:pembeli_username>/<int:produk_id>'
    , '/pembeli/produkAll/<string:pembeli_username>/<string:produk_kategori>'
    , '/pembeli/produkAll/beli/<string:pembeli_username>')


# ==================================================================
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
            DICT={"Status":"OK", "Message":"Pembeli Melihat history transaksi:", "Transaksi":LIST}
            return DICT, 200, {'Content-Type':'application/json'}
        else:
            return {'status':'WRONG CREDENTIAL!', 'message':'Anda tidak memiliki wewenang.'},401

    def options(self, pembeli_username):
        DICT={"Status":"OK", "Message":"Pembeli melakukan registrasi", "Data_Pembeli":"OK Banget"}
        return DICT, 200, {'Content-Type':'application/json'}

api.add_resource(PembeliTransaksi, '/pembeli/transaksi/<string:pembeli_username>')

############################### filter, ini cart ##########################################
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
            # LIST.append("Total Produk dibeli: %d" % totalProduk)
            # LIST.append("Total Bayar: %d" % totalBayar)
            for row in qry.limit(args['rp']).offset(offset).all():
                dataCart = marshal(row, TransaksiPembeli_dbStructure.response_field)
                LIST.append(dataCart)
                totalProduk = totalProduk + dataCart['produk_jumlahBeli']
                totalBayar = totalBayar + dataCart['produk_hargaBayar']
            
            DICT={"Status":"OK", "Message":"Pembeli Melihat Cart:", "totalProduk": totalProduk, "totalBayar":totalBayar , "Cart":LIST}
            return DICT, 200, {'Content-Type':'application/json'}
        else:
            return {'status':'WRONG CREDENTIAL!', 'message':'Anda tidak memiliki wewenang.'},401

    
############################### bayar ##########################################
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

            DICT={"Status":"OK", "Message":"Pembeli Melakukan Pembayaran:", "totalBayar": totalBayar}
            return DICT, 200, {'Content-Type':'application/json'}
        else:
            return {'status':'WRONG CREDENTIAL!', 'message':'Anda tidak memiliki wewenang.'},401

    def options(self, pembeli_username):
        DICT={"Status":"OK", "Message":"Pembeli melakukan registrasi", "Data_Pembeli":"OK Banget"}
        return DICT, 200, {'Content-Type':'application/json'}

api.add_resource(PembeliCart, '/pembeli/cart/<string:pembeli_username>'\
    ,  '/pembeli/cart/bayar/<string:pembeli_username>')


####################################### Popular ########################################
class PembeliProdukPopular(Resource):    
    # @jwt_required
    def get(self, produk_kategori=None, produk_subkategori=None):
        # user = get_jwt_identity()
        # identity = marshal(user, Pembeli_dbStructure.response_field)

        # if identity['pembeli_username'] == pembeli_username:
        if produk_kategori == None:
            # client = memcache.Client([('127.0.0.1', 11211)])
            # isiMem = client.get("getAllPopMem")
            isiMem = None
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
                # sample_obj = LIST 
                # client.set("getAllPopMem", sample_obj, time=15)
                ##########################################################################
                DICT={"Status":"OK", "Message":"Pembeli Melakukan Pencarian Produk Popular disemua produk(DB):", "Produk": LIST}
                return DICT, 200, {'Content-Type':'application/json'}
            else: 
                DICT={"Status":"OK", "Message":"Pembeli Melakukan Pencarian Produk Popular disemua produk (MEM):", "Produk": isiMem}
                return DICT, 200, {'Content-Type':'application/json'}


        elif produk_kategori != None and produk_subkategori ==None:
            # client = memcache.Client([('127.0.0.1', 11211)])
            # isiMem = client.get("getAllPopCatMem")
            isiMem = None
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
                # sample_obj = LIST 
                # client.set("getAllPopCatMem", sample_obj, time=15)
                ##########################################################################
                DICT={"Status":"OK", "Message":"Pembeli Melakukan Pencarian Produk Popular dikategori produk(DB):", "Produk": LIST}
                return DICT, 200, {'Content-Type':'application/json'}
            else:
                DICT={"Status":"OK", "Message":"Pembeli Melakukan Pencarian Produk Popular dikategori produk(MEM):", "Produk": isiMem}
                return DICT, 200, {'Content-Type':'application/json'}

        elif produk_kategori != None and produk_subkategori !=None:
            # client = memcache.Client([('127.0.0.1', 11211)])
            # isiMem = client.get("getAllPopCatSubMem")
            isiMem = None
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
                # sample_obj = LIST 
                # client.set("getAllPopCatSubMem", sample_obj, time=15)
                ##########################################################################
                DICT={"Status":"OK", "Message":"Pembeli Melakukan Pencarian Produk Popular dikategori & subkategori produk(DB):", "Produk": LIST}
                return DICT, 200, {'Content-Type':'application/json'}
            else:
                DICT={"Status":"OK", "Message":"Pembeli Melakukan Pencarian Produk Popular dikategori & subkategori produk(MEM):", "Produk": isiMem}
                return DICT, 200, {'Content-Type':'application/json'}
        else:
            return {'status':'URL warning', 'message':'Unrecognized URL'},401
        # else:
        #     return {'status':'WRONG CREDENTIAL!', 'message':'Anda tidak memiliki wewenang.'},401

    def options(self, pembeli_username):
        DICT={"Status":"OK", "Message":"Pembeli melakukan registrasi", "Data_Pembeli":"OK Banget"}
        return DICT, 200, {'Content-Type':'application/json'}

api.add_resource(PembeliProdukPopular, '/pembeli/produkAll/popular'\
    , '/pembeli/produkAll/popular/<string:produk_kategori>'
    , '/pembeli/produkAll/popular/<string:produk_kategori>/<string:produk_subkategori>')


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
                DICT={"Status":"OK", "Message":"Pembeli Teregister Melakukan Pencarian Produk Search di semua Produk:", "Produk": LIST}
                return DICT, 200, {'Content-Type':'application/json'}
            
            
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
                DICT={"Status":"OK", "Message":"Pembeli Teregister Melakukan Pencarian Produk Search Pada Kategori tertentu:", "Produk": LIST}
                return DICT, 200, {'Content-Type':'application/json'}
            else:
                return {'status':'URL warning', 'message':'Unrecognized URL'},401
        else:
            return {'status':'WRONG CREDENTIAL!', 'message':'Anda tidak memiliki wewenang.'},401

    def options(self, pembeli_username):
        DICT={"Status":"OK", "Message":"Pembeli melakukan registrasi", "Data_Pembeli":"OK Banget"}
        return DICT, 200, {'Content-Type':'application/json'}

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
            DICT={"Status":"OK", "Message":"Pembeli tidak Teregister Melakukan Pencarian Produk Search di semua Produk:", "Produk": LIST}
            return DICT, 200, {'Content-Type':'application/json'}
        

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
            DICT={"Status":"OK", "Message":"Pembeli tidak Teregister Melakukan Pencarian Produk Search Pada Kategori tertentu:", "Produk": LIST}
            return DICT, 200, {'Content-Type':'application/json'}
        else:
            return {'status':'URL warning', 'message':'Unrecognized URL'},401
       
    def options(self, pembeli_username):
        DICT={"Status":"OK", "Message":"Pembeli melakukan registrasi", "Data_Pembeli":"OK Banget"}
        return DICT, 200, {'Content-Type':'application/json'}

api.add_resource(PembeliProdukSearchNot, '/pembeli/produk/search'\
    , '/pembeli/produk/search/<string:produk_kategori>')