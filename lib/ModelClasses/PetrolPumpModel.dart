import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class PetrolPump{
  String address='';
  String addressLong= '';
  String addressLat='';
  String cardAI92Price='';
  String cashAI92Price='';
  String originalAI92Price='';
  String cardAI95Price='';
  String cashAI95Price='';
  String originalAI95Price='';
  String cardAI98Price='';
  String cashAI98Price='';
  String originalAI98Price='';
  String cardDieselPrice='';
  String cashDieselPrice='';
  String originalDieselPrice='';
  String cardWinterDieselPrice='';
  String cashWinterDieselPrice='';
  String originalWinterDieselPrice='';
  String cardLPGPrice='';
  String cashLPGPrice='';
  String originalLPGPrice='';
  String pumpId='';
  List<dynamic> pumpOperators=new List<dynamic>();

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'addressLong': addressLong,
      'addressLat': addressLat,
      'cardAI92Price': cardAI92Price,
      'cashAI92Price': cashAI92Price,
      'originalAI92Price': originalAI92Price,
      'cardAI95Price': cardAI95Price,
      'cashAI95Price': cashAI95Price,
      'originalAI95Price': originalAI95Price,
      'cardAI98Price': cardAI98Price,
      'cashAI98Price': cashAI98Price,
      'originalAI98Price': originalAI98Price,
      'cardDieselPrice': cardDieselPrice,
      'cashDieselPrice': cashDieselPrice,
      'originalDieselPrice': originalDieselPrice,
      'cardWinterDieselPrice': cardWinterDieselPrice,
      'cashWinterDieselPrice': cashWinterDieselPrice,
      'originalWinterDieselPrice': originalWinterDieselPrice,
      'cardLPGPrice': cardLPGPrice,
      'cashLPGPrice': cashLPGPrice,
      'originalLPGPrice': originalLPGPrice,
      'pumpId': pumpId,
      'pumpOperators': pumpOperators,
    };
  }

  PetrolPump(
      {this.address,
        this.addressLong,
        this.addressLat,
        this.cardAI92Price,
        this.cashAI92Price,
        this.originalAI92Price,
        this.cardAI95Price,
        this.originalAI95Price,
        this.cardAI98Price,
        this.cashAI98Price,
        this.originalAI98Price,
        this.cardDieselPrice,
        this.cashDieselPrice,
        this.originalDieselPrice,
        this.cardWinterDieselPrice,
        this.cashWinterDieselPrice,
        this.originalWinterDieselPrice,
        this.cardLPGPrice,
        this.cashLPGPrice,
        this.originalLPGPrice,
        this.pumpId,
        this.pumpOperators});

  void fromMap(DocumentSnapshot doc) {
    this.address = doc.data['address'] ?? '';
    this.addressLong = doc.data['addressLong'];
    this.addressLat = doc.data['addressLat'];
    this.cardAI92Price = doc.data['cardAI92Price'] ?? '';
    this.cashAI92Price = doc.data['cashAI92Price'] ?? '';
    this.originalAI92Price = doc.data['originalAI92Price'];
    this.cardAI95Price = doc.data['cardAI95Price'];
    this.originalAI95Price = doc.data['originalAI95Price'];
    this.cardAI98Price = doc.data['cardAI98Price'];
    this.cashAI98Price = doc.data['cashAI98Price'];
    this.originalAI98Price = doc.data['originalAI98Price'];
    this.cardDieselPrice = doc.data['cardDieselPrice'];
    this.cashDieselPrice = doc.data['cashDieselPrice'];
    this.originalDieselPrice = doc.data['originalDieselPrice'];
    this.cardWinterDieselPrice = doc.data['cardWinterDieselPrice'];
    this.cashWinterDieselPrice = doc.data['cashWinterDieselPrice'];
    this.originalWinterDieselPrice = doc.data['originalWinterDieselPrice'];
    this.cardLPGPrice = doc.data['cardLPGPrice'];
    this.cashLPGPrice = doc.data['cashLPGPrice'];
    this.originalLPGPrice = doc.data['originalLPGPrice'];
    this.pumpId = doc.data['pumpId'];
    if (doc.data['pumpOperators'] != null)
      this.pumpOperators = List.castFrom(doc.data['pumpOperators'] ?? '');
    else {
      this.pumpOperators = new List();
    }
  }











}