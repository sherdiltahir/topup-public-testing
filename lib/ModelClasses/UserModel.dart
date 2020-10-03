// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class User{
//   String name='';
//   String id= '';
//   String phoneNumber='';
//   List<dynamic> cards=new List<dynamic>();
//   List<dynamic> couponsIds=new List<dynamic>();
//   String fcmDeviceCode='';
//   File picture;
//   String pictureUri;
//   String scurityPin;
//   String securityQuestion1;
//   String securityAnswer1;
//
//
//   Map<String, dynamic>  toMap() {
//     return {
//       'name': name,
//       'id': id,
//       'phone': phoneNumber,
//       'card': cards,
//       'couponsIds': couponsIds,
//       'fcmDeviceCode': fcmDeviceCode,
//       'pictureUri': pictureUri,
//       'scurityPin': scurityPin,
//       'securityQuestion1': securityQuestion1,
//       'securityAnswer1': securityAnswer1,
//     };
//   }
//
//
//
//
//   User({this.name, this.id, this.email, this.phone, this.shipments, this.review,
//     this.location, this.fcmDeviceId});
//
//   void  fromMap(DocumentSnapshot doc) {
//     this.name = doc.data['name'] ?? '';
//     this.id = doc.data['id'];
//     this.fcmDeviceId = doc.data['fcmDeviceId'];
//     this.phone = doc.data['phone'] ?? '';
//     this.email = doc.data['email'] ?? '';
//     if (doc.data['shipments'] != null)
//       this.shipments = List.castFrom(doc.data['shipments'] ?? '');
//     else{
//       this.shipments=new List();
//     }
//     this.review = doc.data['review'];
//     this.location = doc.data['location'] ?? '';
//   }
//
// }