import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class FuelTransaction{
  String fuelType='';
  String transactionId= '';
  String paidVia='';
  String price='';
  String status='';
  String userId='';
  String operatorId='';
  String pumpId='';
  DateTime transactionTime;
  double userReview;
  double volume;
  String loyaltyPointsEarned='';
  String couponId='';
  String cardId='';
  Map<String, dynamic> toMap() {
    return {
      'fuelType': fuelType,
      'transactionId': transactionId,
      'paidVia': paidVia,
      'price': price,
      'status': status,
      'userId': userId,
      'operatorId': operatorId,
      'pumpId': pumpId,
      'transactionTime': transactionTime,
      'userReview': userReview,
      'volume': volume,
      'loyaltyPointsEarned': loyaltyPointsEarned,
      'couponId': couponId,
      'cardId': cardId,
    };
  }
  FuelTransaction(
      {this.fuelType,
        this.transactionId,
        this.paidVia,
        this.price,
        this.status,
        this.userId,
        this.operatorId,
        this.pumpId,
        this.transactionTime,
        this.userReview,
        this.volume,
        this.loyaltyPointsEarned,
        this.couponId,
        this.cardId,
      });

  void fromMap(DocumentSnapshot doc) {
    this.fuelType = doc.data['fuelType'] ?? 0;
    this.transactionId = doc.data['transactionId'];
    this.paidVia = doc.data['paidVia'];
    this.price = doc.data['price'] ?? '';
    this.status = doc.data['status'] ?? '';
    this.userId = doc.data['userId'];
    this.operatorId = doc.data['operatorId'];
    this.pumpId = doc.data['pumpId'];
    this.transactionTime = doc.data['transactionTime'];
    this.userReview = doc.data['userReview'];
    this.volume = doc.data['volume'];
    this.loyaltyPointsEarned = doc.data['loyaltyPointsEarned'];
    this.couponId = doc.data['couponId'];
    this.cardId = doc.data['cardId'];
  }

}