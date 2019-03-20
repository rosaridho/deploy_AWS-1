from flask import Flask, request
import logging, json
from flask_restful import Api, fields
from time import strftime
from logging.handlers import RotatingFileHandler
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from blueprints import db


class transStat_dbStructure(db.Model):
    __tablename__ = 'transStat'
    transStat_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    status_code = db.Column(db.String(50), unique=True)
    status_message = db.Column(db.String(50), unique=True)
    transaction_id = db.Column(db.String(100), unique=True)
    order_id = db.Column(db.String(100), unique=True)
    gross_amount = db.Column(db.String(50), unique=True)
    currency = db.Column(db.String(50), unique=True)
    payment_type = db.Column(db.String(50), unique=True)
    transaction_time = db.Column(db.String(50), unique=True)
    transaction_status = db.Column(db.String(50), unique=True)
    approval_code = db.Column(db.String(50), unique=True)
    signature_key = db.Column(db.String(500), unique=True)

    # Response Field
    response_field = {
        'transStat_id' : fields.Integer,
        'status_code' : fields.String,
        'status_message' : fields.String,
        'transaction_id' : fields.String,
        'order_id' : fields.String,
        'gross_amount' : fields.String,
        'currency' : fields.String,
        'payment_type' : fields.String,
        'transaction_time' : fields.String,
        'transaction_status' : fields.String,
        'approval_code' : fields.String,
        'signature_key' : fields.String
    }

    # inisiasi dengan menggunakan db
    def __init__(self, transStat_id, status_code, status_message, transaction_id, order_id, gross_amount, \
        currency, payment_type, transaction_time, transaction_status, approval_code, signature_key):
        self.transStat_id = transStat_id
        self.status_code = status_code
        self.status_message = status_message
        self.transaction_id = transaction_id
        self.order_id = order_id
        self.gross_amount = gross_amount
        self.currency = currency
        self.payment_type = payment_type
        self.transaction_time = transaction_time
        self.transaction_status = transaction_status
        self.approval_code = approval_code
        self.signature_key = signature_key

    def __repr__(self):
        return '<Payment %d>' %self.transStat_id