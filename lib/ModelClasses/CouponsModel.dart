
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Coupon{
  bool used;
  DateTime endingTime;
  DateTime startingTime;
  String couponId;
  String fuelType;
  String price;
  String currentOwnerId;

  Map<String, dynamic> toMap() {
    return {
      'used': used,
      'endingTime': endingTime,
      'startingTime': startingTime,
      'couponId': couponId,
      'fuelType': fuelType,
      'price': price,
      'currentOwnerId': currentOwnerId,
    };
  }
  Coupon(
      {this.used,
        this.endingTime,
        this.startingTime,
        this.price,
        this.couponId,
        this.fuelType,
        this.price,
        this.currentOwnerId,
      });

  void fromMap(DocumentSnapshot doc) {
    this.used = doc.data['used'] ?? 0;
    this.endingTime = doc.data['endingTime'];
    this.startingTime = doc.data['startingTime'];
    this.price = doc.data['price'] ?? '';
    this.couponId = doc.data['couponId'];
    this.fuelType = doc.data['fuelType'];
    this.price = doc.data['price'];
    this.currentOwnerId = doc.data['currentOwnerId'];
  }
}