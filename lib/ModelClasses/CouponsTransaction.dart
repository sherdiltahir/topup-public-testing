import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class CouponsTransaction{
  String fuelType='';
  String transactionId= '';
  String paidVia='';
  String price='';
  String userId='';
  DateTime transactionTime;
  double volume=0.0;
  String cardId;
  Map<String, dynamic> toMap() {
    return {
      'fuelType': fuelType,
      'transactionId': transactionId,
      'paidVia': paidVia,
      'price': price,
      'userId': userId,
      'transactionTime': transactionTime,
      'volume': volume,
      'cardId': cardId,
    };
  }
  CouponsTransaction(
      {this.fuelType,
        this.transactionId,
        this.paidVia,
        this.price,
        this.userId,
        this.transactionTime,
        this.volume,
        this.cardId,
      });

  void fromMap(DocumentSnapshot doc) {
    this.fuelType = doc.data['fuelType'] ?? 0;
    this.transactionId = doc.data['transactionId'];
    this.paidVia = doc.data['paidVia'];
    this.price = doc.data['price'] ?? '';
    this.userId = doc.data['userId'];
    this.transactionTime = doc.data['transactionTime'];
    this.volume = doc.data['volume'];
    this.cardId = doc.data['cardId'];
  }











}