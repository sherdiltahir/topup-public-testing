import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class CouponsAvailable{
  String fuelType;
  String loyaltyPointsRequired;
  String price;
  String volume;

  Map<String, dynamic> toMap() {
    return {
      'fuelType': fuelType,
      'loyaltyPointsRequired': loyaltyPointsRequired,
      'price': price,
      'volume': volume,
    };
  }
  CouponsAvailable(
      {this.fuelType,
        this.loyaltyPointsRequired,
        this.price,
        this.volume,
      });

  void fromMap(DocumentSnapshot doc) {
    this.fuelType = doc.data['fuelType'] ?? 0;
    this.loyaltyPointsRequired = doc.data['loyaltyPointsRequired'];
    this.price = doc.data['price'];
    this.volume = doc.data['volume'] ?? '';
  }
}