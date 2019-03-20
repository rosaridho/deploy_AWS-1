from flask import Blueprint
from flask_restful import Resource, Api, reqparse, marshal
from . import *
from blueprints import db
from flask_jwt_extended import jwt_required
import json, requests
from flask_jwt_extended import create_access_token, \
    get_jwt_identity, jwt_required, get_jwt_claims

bp_penjual = Blueprint('bp_penjual', __name__)
api = Api(bp_penjual)

class Penjual(Resource): 
    # Endpoint for register penjual
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('penjual_email', location='json', required=True)
        parser.add_argument('penjual_password', location='json', required=True)
        parser.add_argument('penjual_username', location='json', required=True)
        parser.add_argument('penjual_namaLengkap', location='json', required=True)
        parser.add_argument('penjual_gender', location='json', required=True)
        parser.add_argument('penjual_lokasiKota', location='json', required=True)
        args = parser.parse_args()

        penjual = Penjual_dbStructure(None, args['penjual_email'], args['penjual_password']\
            , args['penjual_username'], args['penjual_namaLengkap'], args['penjual_gender']\
            , args['penjual_lokasiKota'])

        db.session.add(penjual)
        db.session.commit()
        return marshal(penjual, Penjual_dbStructure.response_field)

    # Get detail data penjual
    @jwt_required
    def get(self, penjual_username):
        user = get_jwt_identity()
        identity = marshal(user, Penjual_dbStructure.response_field)

        if identity['penjual_username'] == penjual_username:
            qry = Penjual_dbStructure.query
            # ini filter gan!
            qry = qry.filter_by(penjual_username=penjual_username)
            penjualByUserName = marshal(qry[0], Penjual_dbStructure.response_field)
            return penjualByUserName, 200, {'Content-Type':'application/json'}
        else:
            return "WRONG CREDENTIAL!"

    # Edit detail data penjual
    @jwt_required
    def put(self, penjual_id=None):
        user = get_jwt_identity()
        identity = marshal(user, Penjual_dbStructure.response_field)

        if identity['penjual_id'] == penjual_id:
            parser = reqparse.RequestParser()
            parser.add_argument('penjual_email', location='json', required=True)
            parser.add_argument('penjual_password', location='json', required=True)
            parser.add_argument('penjual_username', location='json', required=True)
            parser.add_argument('penjual_namaLengkap', location='json', required=True)
            parser.add_argument('penjual_gender', location='json', required=True)
            parser.add_argument('penjual_lokasiKota', location='json', required=True)
            args = parser.parse_args()

            qry = Penjual_dbStructure.query.get(penjual_id)
            qry.penjual_email = args['penjual_email']
            qry.penjual_password = args['penjual_password']
            qry.penjual_username = args['penjual_username']
            qry.penjual_namaLengkap = args['penjual_namaLengkap']
            qry.penjual_gender = args['penjual_gender']
            qry.penjual_lokasiKota = args['penjual_lokasiKota']
                    
            db.session.commit()
            return marshal(qry, Penjual_dbStructure.response_field), 200, \
                {'Content-Type':'application/json'}
        else:
            return "WRONG CREDENTIAL!"

    # Penjual Delete Account
    @jwt_required
    def delete(self, penjual_id=None):
        user = get_jwt_identity()
        identity = marshal(user, Penjual_dbStructure.response_field)

        if identity['penjual_id'] == penjual_id:
            qry = Penjual_dbStructure.query.get(penjual_id)
            if qry is not None:
                db.session.delete(qry)
                db.session.commit()
                return marshal(qry, Penjual_dbStructure.response_field), 200, \
                    {'Content-Type':'application/json'}
            return {'status' : 'NOT_FOUND'}, 404, {'Content-Type':'application/json'}
        else:
            return "WRONG CREDENTIAL!"

api.add_resource(Penjual, '/penjual/register', '/penjual/<int:penjual_id>', \
    '/penjual/<string:penjual_username>' )


class PenjualLogin(Resource):
     # Penjual login to get token;
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('penjual_username', location='json', required=True)
        parser.add_argument('penjual_password', location='json', required=True)
        args = parser.parse_args()
        qry = Penjual_dbStructure.query.filter_by(penjual_username=args['penjual_username'])\
            .filter_by(penjual_password=args['penjual_password']).first()

        if qry is not None:
            token = create_access_token(identity=marshal(qry, Penjual_dbStructure.response_field))
            return {'token' : token}, 200
        else:
            return {'status':'UNAUTORIZED', 'message':'invalid key or secret'},401



api.add_resource(PenjualLogin, '/penjual/login')

############################### products! ##########################################
class PenjualProduk(Resource):    
    # add new product
    @jwt_required
    def post(self, penjual_username):
        user = get_jwt_identity()
        identity = marshal(user, Penjual_dbStructure.response_field)

        if identity['penjual_username'] == penjual_username:
            parser = reqparse.RequestParser()
            parser.add_argument('penjual_id', location='json', required=True)
            parser.add_argument('produk_nama', location='json', required=True)
            parser.add_argument('produk_harga', location='json', required=True)
            parser.add_argument('produk_deskripsi', location='json', required=True)
            parser.add_argument('produk_gambar', location='json', required=True)
            parser.add_argument('produk_stok', location='json', required=True)
            parser.add_argument('produk_kategori', location='json', required=True)
            parser.add_argument('produk_subkategori', location='json', required=True)
            parser.add_argument('produk_statusPromo', location='json', required=True)
            parser.add_argument('produk_diskon', location='json', required=True)
            parser.add_argument('produk_tanggalPost', location='json', required=True)
            # produk_Jumlahdibeli = 0

            args = parser.parse_args()

            produk = Penjual_Produk_dbStructure(None, args['penjual_id'], args['produk_nama']\
                , args['produk_harga'], args['produk_deskripsi'], args['produk_gambar']\
                , args['produk_stok'], args['produk_kategori'], args['produk_subkategori']\
                , args['produk_statusPromo'], args['produk_diskon']\
                , int(args['produk_harga']) - (int(args['produk_harga']) * (int(args['produk_diskon'])/10))\
                , args['produk_tanggalPost'], int(0))

            db.session.add(produk)
            db.session.commit()
            return marshal(produk, Penjual_Produk_dbStructure.response_field)
        else:
            return "WRONG CREDENTIAL!"

    @jwt_required
    def get(self, penjual_id, produk_id=None):
        user = get_jwt_identity()
        identity = marshal(user, Penjual_dbStructure.response_field)

        if identity['penjual_id'] == penjual_id:
            if produk_id == None:
                parser = reqparse.RequestParser()
                parser.add_argument('p', type=int, location='args', default=1)
                parser.add_argument('rp', type=int, location='args', default=5)
                args = parser.parse_args()
                offset = (args['p'] * args['rp']) - args['rp']
                qry = Penjual_Produk_dbStructure.query
                qry = qry.filter_by(penjual_id=penjual_id)
                LIST = []
                for row in qry.limit(args['rp']).offset(offset).all():
                    LIST.append(marshal(row, Penjual_Produk_dbStructure.response_field))
                return LIST, 200, {'Content-Type':'application/json'}
            else:
                qry = Penjual_Produk_dbStructure.query
                qry = qry.filter_by(penjual_id=penjual_id)
                qry = qry.filter_by(produk_id=produk_id)
                productById = marshal(qry[0], Penjual_Produk_dbStructure.response_field)
                return productById, 200, {'Content-Type':'application/json'}
        else:
            return "WRONG CREDENTIAL!"

    @jwt_required
    def put(self, penjual_id, produk_id):
        user = get_jwt_identity()
        identity = marshal(user, Penjual_dbStructure.response_field)

        if identity['penjual_id'] == penjual_id:
            parser = reqparse.RequestParser()
            parser.add_argument('produk_nama', location='json', required=True)
            parser.add_argument('produk_harga', location='json', required=True)
            parser.add_argument('produk_deskripsi', location='json', required=True)
            parser.add_argument('produk_gambar', location='json', required=True)
            parser.add_argument('produk_stok', location='json', required=True)
            parser.add_argument('produk_kategori', location='json', required=True)
            parser.add_argument('produk_subkategori', location='json', required=True)
            parser.add_argument('produk_statusPromo', location='json', required=True)
            parser.add_argument('produk_diskon', location='json', required=True)
            parser.add_argument('produk_tanggalPost', location='json', required=True)
            args = parser.parse_args()

            qry = Penjual_Produk_dbStructure.query.get(produk_id)

            qry.penjual_id = penjual_id
            qry.produk_nama = args['produk_nama']
            qry.produk_harga = args['produk_harga']
            qry.produk_deskripsi = args['produk_deskripsi']
            qry.produk_gambar = args['produk_gambar']
            qry.produk_stok = args['produk_stok']
            qry.produk_kategori = args['produk_kategori']
            qry.produk_subkategori = args['produk_subkategori']
            qry.produk_statusPromo = args['produk_statusPromo']
            qry.produk_diskon = args['produk_diskon']
            qry.produk_hargaDiskon = int(args['produk_harga']) - (int(args['produk_harga']) \
                * (int(args['produk_diskon'])/10))
            qry.produk_tanggalPost = args['produk_tanggalPost']
            qry.produk_Jumlahdibeli = qry.produk_Jumlahdibeli
                
            db.session.commit()
            return marshal(qry, Penjual_Produk_dbStructure.response_field), \
                200, {'Content-Type':'application/json'}
        else:
            return "WRONG CREDENTIAL!"

    @jwt_required
    def delete(self, penjual_id, produk_id):
        user = get_jwt_identity()
        identity = marshal(user, Penjual_dbStructure.response_field)

        if identity['penjual_id'] == penjual_id:
            qry = Penjual_Produk_dbStructure.query.get(produk_id)
            if qry is not None:
                db.session.delete(qry)
                db.session.commit()
                return marshal(qry, Penjual_Produk_dbStructure.response_field), 200, \
                    {'Content-Type':'application/json'}
            return {'status' : 'NOT_FOUND'}, 404, {'Content-Type':'application/json'}
        else:
            return "WRONG CREDENTIAL!"


api.add_resource(PenjualProduk, '/penjual/produk/<string:penjual_username>'\
    , '/penjual/produk/<int:penjual_id>'
    , '/penjual/produk/<int:penjual_id>/<int:produk_id>')