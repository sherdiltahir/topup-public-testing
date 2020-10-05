import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class CouponSharing{
  DateTime transferTime;
  String couponId;
  String sentBy;
  String sentTo;
  String transactionId;


  Map<String, dynamic> toMap() {
    return {
      'transferTime': transferTime,
      'couponId': couponId,
      'sentBy': sentBy,
      'sentTo': sentTo,
      'transactionId': transactionId,
    };
  }
  CouponSharing(
      {this.transferTime,
        this.couponId,
        this.sentBy,
        this.sentTo,
        this.transactionId
      });

  void fromMap(DocumentSnapshot doc) {
    this.transferTime = doc.data['transferTime'] ?? 0;
    this.couponId = doc.data['couponId'];
    this.sentBy = doc.data['sentBy'];
    this.sentTo = doc.data['sentTo'] ?? '';
    this.transactionId = doc.data['transactionId'];
  }
}