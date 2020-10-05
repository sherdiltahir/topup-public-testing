import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Operator{
  double ratings;
  bool approved;
  DateTime endingTime;
  String fcmDevice;
  String name;
  String operatorId;
  String phoneNumber;
  String pictureURI;
  File picture;
  String pumpId;
  DateTime startingTime;
  Map<String, dynamic> toMap() {
    return {
      'ratings': ratings,
      'phone': phoneNumber,
      'approved': approved,
      'endingTime': endingTime,
      'fcmDevice': fcmDevice,
      'name': name,
      'operatorId': operatorId,
      'pumpId': pumpId,
      'startingTime': startingTime,
    };
  }

  Operator(
      {this.ratings,
        this.phoneNumber,
        this.approved,
        this.endingTime,
        this.fcmDevice,
        this.name,
        this.operatorId,
        this.pumpId,
        this.startingTime});

  void fromMap(DocumentSnapshot doc) {
    this.ratings = doc.data['ratings'] ?? 0;
    this.phoneNumber = doc.data['phoneNumber'];
    this.approved = doc.data['approved'];
    this.endingTime = doc.data['endingTime'] ?? '';
    this.fcmDevice = doc.data['fcmDevice'] ?? '';
    this.name = doc.data['name'];
    this.operatorId = doc.data['operatorId'];
    this.pumpId = doc.data['pumpId'];
    this.startingTime = doc.data['startingTime'];
  }
  




}