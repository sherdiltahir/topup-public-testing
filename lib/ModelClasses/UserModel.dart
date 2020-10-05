import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'CardModel.dart';

class User {
  String name = '';
  String id = '';
  String phoneNumber = '';
  List<Card> cards = new List<Card>();
  List<dynamic> couponsIds = new List<dynamic>();
  String fcmDeviceCode = '';
  File picture;
  String pictureUri;
  String securityPin;
  String securityQuestion1;
  String securityAnswer1;
  String securityQuestion2;
  String securityAnswer2;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'phone': phoneNumber,
      'card': cards,
      'couponsIds': couponsIds,
      'fcmDeviceCode': fcmDeviceCode,
      'pictureUri': pictureUri,
      'securityPin': securityPin,
      'securityQuestion1': securityQuestion1,
      'securityAnswer1': securityAnswer1,
      'securityQuestion2': securityQuestion2,
      'securityAnswer2': securityAnswer2,
    };
  }

  User(
      {this.name,
      this.id,
      this.phoneNumber,
      this.cards,
      this.couponsIds,
      this.fcmDeviceCode,
      this.pictureUri,
      this.securityPin,
      this.securityQuestion1,
      this.securityAnswer1});

  void fromMap(DocumentSnapshot doc) {
    this.name = doc.data['name'] ?? '';
    this.id = doc.data['id'];
    this.phoneNumber = doc.data['phoneNumber'];
    this.fcmDeviceCode = doc.data['fcmDeviceCode'] ?? '';
    this.pictureUri = doc.data['pictureUri'] ?? '';
    if (doc.data['Card'] != null)
    {
      this.cards = new List();
      for (var value in doc.data['Card']) {
        this.cards.add(Card(value));
      }
    }
    if (doc.data['couponsIds'] != null)
      this.couponsIds = List.castFrom(doc.data['couponsIds'] ?? '');
    else {
      this.couponsIds = new List();
    }
    this.securityPin = doc.data['securityPin'];
    this.securityQuestion1 = doc.data['securityQuestion1'];
    this.securityQuestion2 = doc.data['securityQuestion2'];
    this.securityAnswer1 = doc.data['securityAnswer1'];
    this.securityAnswer2 = doc.data['securityAnswer2'];
  }
}
