from flask import Flask, request
import logging, json
from flask_restful import Api, fields
from time import strftime
from logging.handlers import RotatingFileHandler
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from blueprints import db


class Admin_dbStructure(db.Model):
    __tablename__ = 'admin'
    admin_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    admin_password = db.Column(db.String(50), unique=True)
    admin_username = db.Column(db.String(50), unique=True)

    # Response Field
    response_field = {
        'admin_id' : fields.Integer,
        'admin_password' : fields.String,
        'admin_username' : fields.String,
    }

    # inisiasi dengan menggunakan db
    def __init__(self, admin_id, admin_password, admin_username):
        self.admin_id = admin_id
        self.admin_password = admin_password
        self.admin_username = admin_username

    def __repr__(self):
        return '<Admin %d>' %self.admin_id