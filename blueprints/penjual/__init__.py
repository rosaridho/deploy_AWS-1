from flask import Flask, request
import logging, json
from flask_restful import Api, fields
from time import strftime
from logging.handlers import RotatingFileHandler
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from blueprints import db

class Penjual_dbStructure(db.Model):

    ################################## penjual ###########################################
    __tablename__ = 'penjual'
    penjual_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    penjual_email = db.Column(db.String(50), unique=True)
    penjual_password = db.Column(db.String(50), unique=True)
    penjual_username = db.Column(db.String(50), unique=True)
    penjual_namaLengkap = db.Column(db.String(50), unique=True)
    penjual_gender = db.Column(db.String(50))
    penjual_lokasiKota = db.Column(db.String(50))

    # Response Field
    response_field = {
        'penjual_id' : fields.Integer,
        'penjual_email' : fields.String,
        'penjual_password' : fields.String,
        'penjual_username' : fields.String,
        'penjual_namaLengkap' : fields.String,
        'penjual_gender' : fields.String,
        'penjual_lokasiKota' : fields.String
    }

    ##respon baru
    # token_field = {
    #     'penjual_password' : fields.String,
    #     'penjual_username' : fields.String
    # }

    # inisiasi dengan menggunakan db
    def __init__(self, penjual_id, penjual_email, penjual_password, penjual_username, \
        penjual_namaLengkap, penjual_gender, penjual_lokasiKota):
        self.penjual_id = penjual_id
        self.penjual_email = penjual_email
        self.penjual_password = penjual_password
        self.penjual_username = penjual_username
        self.penjual_namaLengkap = penjual_namaLengkap
        self.penjual_gender = penjual_gender
        self.penjual_lokasiKota = penjual_lokasiKota

    def __repr__(self):
        return '<Penjual %d>' %self.penjual_username

    
class Penjual_Produk_dbStructure(db.Model):
    
    ################################## products ###########################################
    __tablename__ = 'produk'
    produk_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    penjual_id = db.Column(db.Integer) 
    produk_nama = db.Column(db.String(50))
    produk_harga = db.Column(db.Integer)
    produk_deskripsi = db.Column(db.String(500))
    produk_gambar = db.Column(db.String(100))
    produk_stok = db.Column(db.Integer)
    produk_kategori = db.Column(db.String(50))
    produk_subkategori = db.Column(db.String(50))
    produk_statusPromo = db.Column(db.Integer)
    produk_diskon = db.Column(db.Integer)
    produk_hargaDiskon = db.Column(db.Integer)
    produk_tanggalPost = db.Column(db.String(50))
    produk_Jumlahdibeli = db.Column(db.Integer)

    # Response Field
    response_field = {
        'produk_id' : fields.Integer,
        'penjual_id' : fields.Integer,
        'produk_nama' : fields.String,
        'produk_harga' : fields.Integer,
        'produk_deskripsi' : fields.String,
        'produk_gambar' : fields.String,
        'produk_stok' : fields.Integer,
        'produk_kategori' : fields.String,
        'produk_subkategori' : fields.String,
        'produk_statusPromo' : fields.Integer,
        'produk_diskon' : fields.Integer,
        'produk_hargaDiskon' : fields.Integer,
        'produk_tanggalPost' : fields.String,
        'produk_Jumlahdibeli' : fields.Integer
    }

    # inisiasi dengan menggunakan db
    def __init__(self, produk_id, penjual_id, produk_nama, produk_harga, \
        produk_deskripsi, produk_gambar, produk_stok, produk_kategori, produk_subkategori,\
        produk_statusPromo, produk_diskon, produk_hargaDiskon, produk_tanggalPost, \
        produk_Jumlahdibeli):
        self.produk_id = produk_id
        self.penjual_id = penjual_id
        self.produk_nama = produk_nama
        self.produk_harga = produk_harga
        self.produk_deskripsi = produk_deskripsi
        self.produk_gambar = produk_gambar
        self.produk_stok = produk_stok
        self.produk_kategori = produk_kategori
        self.produk_subkategori = produk_subkategori
        self.produk_statusPromo = produk_statusPromo
        self.produk_diskon = produk_diskon
        self.produk_hargaDiskon = produk_hargaDiskon
        self.produk_tanggalPost = produk_tanggalPost
        self.produk_Jumlahdibeli = produk_Jumlahdibeli

    def __repr__(self):
        return '<Penjual %d>' %self.produk_id