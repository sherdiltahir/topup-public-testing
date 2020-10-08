import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:topup/Services/FirebaseAuthService.dart';

import 'CardModel.dart';

class User extends ChangeNotifier {
  String _name = '';
  String _id = '';
  String _phoneNumber = '';
  List<BankCard> _cards = new List<BankCard>();
  List<dynamic> _couponsIds = new List<dynamic>();
  String _fcmDeviceCode = '';
  File _picture;
  String _pictureUri = '';

  String _securityPin;
  String _securityQuestion1;
  String _securityAnswer1;
  String _securityQuestion2;
  String _securityAnswer2;

  User.fromData(String id) {
    this.id = id;
  }

  User();

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'phoneNumber': phoneNumber,
      'cards': cards != null
          ? cards.map((BankCard bankCard) {
              return bankCard.toMap();
            }).toList()
          : new List(),
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

  void fromMap(DocumentSnapshot doc) {
    this.name = doc.data['name'] ?? '';
    this.id = doc.data['id'];
    this.phoneNumber = doc.data['phoneNumber'];
    this.fcmDeviceCode = doc.data['fcmDeviceCode'] ?? '';
    this.pictureUri = doc.data['pictureUri'] ?? '';
    if (doc.data['cards'] != null) {
      this.cards = new List();
      for (var value in doc.data['cards']) {
        this.cards.add(BankCard.doc(value));
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
    notifyListeners();
  }

  void fromUser(User user) {
    this.name = user.name;
    this.id = user.id;
    this.phoneNumber = user.phoneNumber;
    this.fcmDeviceCode = user.fcmDeviceCode;
    this.pictureUri = user.pictureUri;
    this.cards = user.cards;
    this.couponsIds = user.couponsIds;
    this.securityPin = user.securityPin;
    this.securityQuestion1 = user.securityQuestion1;
    this.securityQuestion2 = user.securityQuestion2;
    this.securityAnswer1 = user.securityAnswer1;
    this.securityAnswer2 = user.securityAnswer2;
    notifyListeners();
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  List<BankCard> get cards => _cards;

  set cards(List<BankCard> value) {
    _cards = value;
  }

  List<dynamic> get couponsIds => _couponsIds;

  set couponsIds(List<dynamic> value) {
    _couponsIds = value;
  }

  String get fcmDeviceCode => _fcmDeviceCode;

  set fcmDeviceCode(String value) {
    _fcmDeviceCode = value;
  }

  File get picture => _picture;

  set picture(File value) {
    _picture = value;
  }

  String get pictureUri => _pictureUri;

  set pictureUri(String value) {
    _pictureUri = value;
  }

  String get securityPin => _securityPin;

  set securityPin(String value) {
    _securityPin = value;
  }

  String get securityQuestion1 => _securityQuestion1;

  set securityQuestion1(String value) {
    _securityQuestion1 = value;
  }

  String get securityAnswer1 => _securityAnswer1;

  set securityAnswer1(String value) {
    _securityAnswer1 = value;
  }

  String get securityQuestion2 => _securityQuestion2;

  set securityQuestion2(String value) {
    _securityQuestion2 = value;
  }

  String get securityAnswer2 => _securityAnswer2;

  set securityAnswer2(String value) {
    _securityAnswer2 = value;
  }

  void updateNameAndPicture(String name, String pictureUri) {
    this.name = name;
    this.pictureUri = pictureUri;
    notifyListeners();
  }
  void updateName(String name) {
    this.name = name;
    notifyListeners();
  }
void updatePicture(String pictureUri) {
    this.pictureUri = pictureUri;
    notifyListeners();
  }
}
