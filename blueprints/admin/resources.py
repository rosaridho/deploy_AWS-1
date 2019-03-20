from flask import Blueprint
from flask_restful import Resource, Api, reqparse, marshal
from . import *
from blueprints import db
from flask_jwt_extended import jwt_required
import json, requests
from flask_jwt_extended import create_access_token, \
    get_jwt_identity, jwt_required, get_jwt_claims
from ..penjual import Penjual_dbStructure, Penjual_Produk_dbStructure
from ..pembeli import Pembeli_dbStructure

bp_admin = Blueprint('bp_admin', __name__)
api = Api(bp_admin)


class Admin(Resource):
    @jwt_required
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('admin_password', location='json', required=True)
        parser.add_argument('admin_username', location='json', required=True)
        args = parser.parse_args()

        admin = Admin_dbStructure(None, args['admin_password'], args['admin_username'])

        db.session.add(admin)
        db.session.commit()
        return marshal(admin, Admin_dbStructure.response_field)

    @jwt_required
    def get(self, admin_username=None):
        if admin_username == None:
            parser = reqparse.RequestParser()
            parser.add_argument('p', type=int, location='args', default=1)
            parser.add_argument('rp', type=int, location='args', default=5)
            args = parser.parse_args()
            offset = (args['p'] * args['rp']) - args['rp']
            qry = Admin_dbStructure.query
            LIST = []
            for row in qry.limit(args['rp']).offset(offset).all():
                LIST.append(marshal(row, Admin_dbStructure.response_field))
            return LIST, 200, {'Content-Type':'application/json'}
        else:
            qry = Admin_dbStructure.query
            qry = qry.filter_by(admin_username=admin_username)
            adminByUserName = marshal(qry[0], Admin_dbStructure.response_field)
            return adminByUserName, 200, {'Content-Type':'application/json'}

    @jwt_required
    def put(self, admin_id=None):
        parser = reqparse.RequestParser()
        parser.add_argument('admin_password', location='json', required=True)
        parser.add_argument('admin_username', location='json', required=True)
        args = parser.parse_args()

        qry = Admin_dbStructure.query.get(admin_id)
        qry.admin_password = args['admin_password']
        qry.admin_username = args['admin_username']
                
        db.session.commit()
        return marshal(qry, Admin_dbStructure.response_field), 200, {'Content-Type':'application/json'}

    @jwt_required
    def delete(self, admin_id=None):
        qry = Admin_dbStructure.query.get(admin_id)
        if qry is not None:
            db.session.delete(qry)
            db.session.commit()
            return marshal(qry, Admin_dbStructure.response_field), 200, {'Content-Type':'application/json'}
        return {'status' : 'NOT_FOUND'}, 404, {'Content-Type':'application/json'}

api.add_resource(Admin, '/admin', '/admin/<int:admin_id>', '/admin/<string:admin_username>')


class AdminLogin(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('admin_username', location='json', required=True)
        parser.add_argument('admin_password', location='json', required=True)
        args = parser.parse_args()
        qry = Admin_dbStructure.query.filter_by(admin_username=args['admin_username'])\
            .filter_by(admin_password=args['admin_password']).first()

        if qry is not None:
            token = create_access_token(identity=marshal(qry, Admin_dbStructure.response_field))
            return {'token' : token}, 200
        else:
            return {'status':'UNAUTORIZED', 'message':'invalid key or secret'},401

api.add_resource(AdminLogin, '/admin/login')


class Admin_Penjual(Resource):

    @jwt_required
    def get(self, penjual_username=None):
        if penjual_username == None:
            parser = reqparse.RequestParser()
            parser.add_argument('p', type=int, location='args', default=1)
            parser.add_argument('rp', type=int, location='args', default=5)
            args = parser.parse_args()
            offset = (args['p'] * args['rp']) - args['rp']
            qry = Penjual_dbStructure.query
            LIST = []
            for row in qry.limit(args['rp']).offset(offset).all():
                LIST.append(marshal(row, Penjual_dbStructure.response_field))
            return LIST, 200, {'Content-Type':'application/json'}
        else:
            qry = Penjual_dbStructure.query
            qry = qry.filter_by(penjual_username=penjual_username)
            penjualByUserName = marshal(qry[0], Penjual_dbStructure.response_field)
            return penjualByUserName, 200, {'Content-Type':'application/json'}

    @jwt_required
    def delete(self, penjual_username=None):
        # qry = Penjual_dbStructure.query.get(penjual_username)
        qry = Penjual_dbStructure.query
        qry = qry.filter_by(penjual_username=penjual_username)
        qry = qry[0]
        if qry is not None:
            db.session.delete(qry)
            db.session.commit()
            return marshal(qry, Penjual_dbStructure.response_field), 200, {'Content-Type':'application/json'}
        return {'status' : 'NOT_FOUND'}, 404, {'Content-Type':'application/json'}

api.add_resource(Admin_Penjual, '/admin/penjual', '/admin/penjual/<string:penjual_username>')


class Admin_Produk(Resource):

    @jwt_required
    def get(self, penjual_username=None):
        if penjual_username == None:
            parser = reqparse.RequestParser()
            parser.add_argument('p', type=int, location='args', default=1)
            parser.add_argument('rp', type=int, location='args', default=5)
            args = parser.parse_args()
            offset = (args['p'] * args['rp']) - args['rp']
            qry = Penjual_Produk_dbStructure.query
            LIST = []
            for row in qry.limit(args['rp']).offset(offset).all():
                LIST.append(marshal(row, Penjual_Produk_dbStructure.response_field))
            return LIST, 200, {'Content-Type':'application/json'}
        else:
            qry = Penjual_Produk_dbStructure.query
            qry = qry.filter_by(penjual_username=penjual_username)
            userByUserName = marshal(qry[0], Penjual_Produk_dbStructure.response_field)
            return userByUserName, 200, {'Content-Type':'application/json'}

    @jwt_required
    def delete(self, produk_penjual_id=None):
        qry = Penjual_Produk_dbStructure.query.get(produk_penjual_id)
        if qry is not None:
            db.session.delete(qry)
            db.session.commit()
            return marshal(qry, Penjual_Produk_dbStructure.response_field), 200, {'Content-Type':'application/json'}
        return {'status' : 'NOT_FOUND'}, 404, {'Content-Type':'application/json'}

api.add_resource(Admin_Produk, '/admin/produk', '/admin/produk/<int:produk_penjual_id>')


class Admin_Pembeli(Resource):

    @jwt_required
    def get(self, pembeli_username=None):
        if pembeli_username == None:
            parser = reqparse.RequestParser()
            parser.add_argument('p', type=int, location='args', default=1)
            parser.add_argument('rp', type=int, location='args', default=5)
            args = parser.parse_args()
            offset = (args['p'] * args['rp']) - args['rp']
            qry = Pembeli_dbStructure.query
            LIST = []
            for row in qry.limit(args['rp']).offset(offset).all():
                LIST.append(marshal(row, Pembeli_dbStructure.response_field))
            return LIST, 200, {'Content-Type':'application/json'}
        else:
            qry = Pembeli_dbStructure.query
            qry = qry.filter_by(pembeli_username=pembeli_username)
            pembeliByUserName = marshal(qry[0], Pembeli_dbStructure.response_field)
            return pembeliByUserName, 200, {'Content-Type':'application/json'}

    @jwt_required
    def delete(self, pembeli_username=None):
        # qry = Penjual_dbStructure.query.get(penjual_username)
        qry = Pembeli_dbStructure.query
        qry = qry.filter_by(pembeli_username=pembeli_username)
        qry = qry[0]
        if qry is not None:
            db.session.delete(qry)
            db.session.commit()
            return marshal(qry, Pembeli_dbStructure.response_field), 200, {'Content-Type':'application/json'}
        return {'status' : 'NOT_FOUND'}, 404, {'Content-Type':'application/json'}

api.add_resource(Admin_Pembeli, '/admin/pembeli', '/admin/pembeli/<string:pembeli_username>')