import requests
from flask import Blueprint
from flask_restful import Resource, Api, reqparse, marshal
from . import *
from blueprints import db
import logging, json
from flask_jwt_extended import create_access_token, get_jwt_identity, jwt_required, get_jwt_claims
import time

bp_payment = Blueprint('bp_payment', __name__)
api = Api(bp_payment)

class MidTransGetTransStatus(Resource):
    wio_host = 'https://api.sandbox.midtrans.com/v2' #development
    # wio_host = 'https://api.midtrans.com' #production

    def get(self, transID):

        qry = requests.get(self.wio_host + '/'+ transID + '/status')
        # data  = marshal(qry, transStat_dbStructure.response_field), \
                # 200, {'Content-Type':'application/json'}
        data = qry.json()
        # transStat = transStat_dbStructure(None, data)
        # db.session.add(transStat)
        # db.session.commit()

        return data

api.add_resource(MidTransGetTransStatus, '/trans/<string:transID>')
