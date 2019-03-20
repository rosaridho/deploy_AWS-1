from flask import Flask, request
import logging, json
from flask_restful import Api, fields
from time import strftime
from logging.handlers import RotatingFileHandler
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from blueprints import db

class Pembeli_dbStructure(db.Model):

    ################################## penjual ###########################################
    __tablename__ = 'pembeli'
    pembeli_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    pembeli_email = db.Column(db.String(50), unique=True)
    pembeli_password = db.Column(db.String(50), unique=True)
    pembeli_username = db.Column(db.String(50), unique=True)
    pembeli_namaLengkap = db.Column(db.String(50), unique=True)
    pembeli_gender = db.Column(db.String(50))
    pembeli_lokasiKota =  db.Column(db.String(50))
    pembeli_pekerjaan = db.Column(db.String(50))

    # Response Field
    response_field = {
        'pembeli_id' : fields.Integer,
        'pembeli_email' : fields.String,
        'pembeli_password' : fields.String,
        'pembeli_username' : fields.String,
        'pembeli_namaLengkap' : fields.String,
        'pembeli_gender' : fields.String,
        'pembeli_lokasiKota' : fields.String,
        'pembeli_pekerjaan' : fields.String
    }

    # inisiasi dengan menggunakan db
    def __init__(self, pembeli_id, pembeli_email, pembeli_password, pembeli_username,\
        pembeli_namaLengkap, pembeli_gender, pembeli_lokasiKota, pembeli_pekerjaan):
        self.pembeli_id = pembeli_id
        self.pembeli_email = pembeli_email
        self.pembeli_password = pembeli_password
        self.pembeli_username = pembeli_username
        self.pembeli_namaLengkap = pembeli_namaLengkap
        self.pembeli_gender = pembeli_gender
        self.pembeli_lokasiKota = pembeli_lokasiKota
        self.pembeli_pekerjaan = pembeli_pekerjaan

    def __repr__(self):
        return '<Pembeli %d>' %self.pembeli_username


class TransaksiPembeli_dbStructure(db.Model):

    ################################## transaksi ###########################################
    __tablename__ = 'transaksiPembeli'
    transaksiPembeli_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    pembeli_username = db.Column(db.String(50))
    produk_id = db.Column(db.Integer) 
    penjual_id = db.Column(db.Integer) 
    produk_nama = db.Column(db.String(50))
    produk_harga = db.Column(db.Integer)
    produk_deskripsi = db.Column(db.String(500))
    produk_jumlahBeli = db.Column(db.Integer)
    produk_statusPromo = db.Column(db.Integer)
    produk_diskon = db.Column(db.Integer)
    produk_hargaDiskon = db.Column(db.Integer)
    produk_tanggalBeli = db.Column(db.String(50))
    transaksi_status = db.Column(db.String(50))
    produk_hargaBayar = db.Column(db.Integer)

    # Response Field
    response_field = {
        'transaksiPembeli_id' : fields.Integer,
        'pembeli_username' : fields.String,
        'produk_id' : fields.Integer,
        'penjual_id' : fields.Integer,
        'produk_nama' : fields.String,
        'produk_harga' : fields.Integer,
        'produk_deskripsi' : fields.String,
        'produk_jumlahBeli' : fields.Integer,
        'produk_statusPromo' : fields.Integer,
        'produk_diskon' : fields.Integer,
        'produk_hargaDiskon' : fields.Integer,
        'produk_tanggalBeli' : fields.String,
        'transaksi_status' : fields.String,
        'produk_hargaBayar' : fields.Integer,
    }

    # inisiasi dengan menggunakan db
    def __init__(self, transaksiPembeli_id, pembeli_username, produk_id, penjual_id, produk_nama, produk_harga, \
        produk_deskripsi, produk_jumlahBeli, produk_statusPromo, produk_diskon,\
        produk_hargaDiskon, produk_tanggalBeli, transaksi_status, produk_hargaBayar):
        self.transaksiPembeli_id = transaksiPembeli_id
        self.pembeli_username = pembeli_username
        self.produk_id = produk_id
        self.penjual_id = penjual_id
        self.produk_nama = produk_nama
        self.produk_harga = produk_harga
        self.produk_deskripsi = produk_deskripsi
        self.produk_jumlahBeli = produk_jumlahBeli
        self.produk_statusPromo = produk_statusPromo
        self.produk_diskon = produk_diskon
        self.produk_hargaDiskon = produk_hargaDiskon
        self.produk_tanggalBeli = produk_tanggalBeli
        self.transaksi_status = transaksi_status
        self.produk_hargaBayar = produk_hargaBayar

    def __repr__(self):
        return '<TransaksiPembeli %d>' %self.transaksiPembeli_id