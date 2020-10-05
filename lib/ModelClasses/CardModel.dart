import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Card {
  String cardId;
  String cardName;
  String cardExpiry;
  String cardNumber;
  String cardKey;

  Map<String, dynamic> toMap() {
    return {
      'cardId': cardId,
      'cardName': cardName,
      'cardExpiry': cardExpiry,
      'cardNumber': cardNumber,
      'cardKey': cardKey,
    };
  }
  Card(var doc){
    this.fromMap(doc);
  }
  // Card(
  //     {this.cardId,
  //     this.cardName,
  //     this.cardExpiry,
  //     this.cardNumber,
  //     this.cardKey});

  void fromMap(var doc) {
    this.cardId = doc['cardId'] ?? '';
    this.cardName = doc['cardName'] ?? '';
    this.cardExpiry = doc['cardExpiry'] ?? '';
    this.cardNumber = doc['cardNumber'] ?? '';
    this.cardKey = doc['cardKey'] ?? '';
  }
}


