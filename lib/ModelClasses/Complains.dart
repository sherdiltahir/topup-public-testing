import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class Complain{
  String complainText;
  String complainBy;
  String complainId;
  String complainType;
  String complainantId;
  String status;
  DateTime lastUpdateTime;

  Map<String, dynamic> toMap() {
    return {
      'complainText': complainText,
      'complainBy': complainBy,
      'complainId': complainId,
      'complainType': complainType,
      'complainantId': complainantId,
      'status': status,
      'lastUpdateTime': lastUpdateTime,
    };
  }
  Complain(
      {this.complainText,
        this.complainBy,
        this.complainId,
        this.complainType,
        this.complainantId,
        this.status,
        this.lastUpdateTime
      });

  void fromMap(DocumentSnapshot doc) {
    this.complainText = doc.data['complainText'] ?? 0;
    this.complainBy = doc.data['complainBy'];
    this.complainId = doc.data['complainId'];
    this.complainType = doc.data['complainType'] ?? '';
    this.complainantId = doc.data['complainantId'];
    this.status = doc.data['status'];
    this.lastUpdateTime = doc.data['lastUpdateTime'];
  }
}