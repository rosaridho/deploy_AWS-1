from flask import Flask, request
from flask_restful import Resource, Api, reqparse, abort
from time import strftime
import json, logging
from logging.handlers import RotatingFileHandler
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate, MigrateCommand
from flask_script import Manager
from flask_jwt_extended import JWTManager
from datetime import timedelta

app=Flask(__name__)

### The following line is related to DB ###
# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@127.0.0.1:3306/db_ecommerce'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://ridhorosa:123698@172.31.4.248:3306/db_ecommerce'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
### The following line is related to JWT ###
app.config['JWT_SECRET_KEY'] = '1234'
app.config['JWT_ACCESS_TOKEN_EXPIRES'] = timedelta(days=30)

jwt = JWTManager(app)
@jwt.user_claims_loader
def add_claims_to_access_token(identity):
    return identity

db = SQLAlchemy(app)
migrate = Migrate(app,db)

manager = Manager(app)
manager.add_command('db', MigrateCommand)

# catch 404 default error withh catch_all_404s=True
api = Api(app, catch_all_404s=True)
                                       
@app.after_request
def after_request(response):
    if request.method=="GET":
        app.logger.warning("REQUEST LOG\t\%s %s ", response.status_code, json.dumps({'request':request.args.to_dict(), 'response': json.loads(response.data.decode('utf-8'))}))
    else :  
        app.logger.warning("REQUEST LOG\t\%s %s", response.status_code, json.dumps({'request':request.get_json(), 'response': json.loads(response.data.decode('utf-8'))}))
    return response

# the blueprints
from blueprints.penjual.resources import bp_penjual
from blueprints.admin.resources import bp_admin
from blueprints.pembeli.resources import bp_pembeli
from blueprints.pembayaran.resources import bp_payment

app.register_blueprint(bp_penjual)
app.register_blueprint(bp_admin)
app.register_blueprint(bp_pembeli)
app.register_blueprint(bp_payment)

# create Database
db.create_all()