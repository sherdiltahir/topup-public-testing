import 'package:cloud_firestore/cloud_firestore.dart';

class PushNotification{
  String id='';
  String timeStampField= '';
  String text='';
  String imageURI='';
  String dataPayload='';
  String comments='';
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'timeStampField': timeStampField,
      'text': text,
      'imageURI': imageURI,
      'dataPayload': dataPayload,
      'comments': comments,

    };
  }
  PushNotification(
      {this.id,
        this.timeStampField,
        this.text,
        this.imageURI,
        this.dataPayload,
        this.comments,

      });

  void fromMap(DocumentSnapshot doc) {
    this.id = doc.data['id'] ?? 0;
    this.timeStampField = doc.data['timeStampField'];
    this.text = doc.data['text'];
    this.imageURI = doc.data['imageURI'] ?? '';
    this.dataPayload = doc.data['dataPayload'] ?? '';
    this.comments = doc.data['comments'];
}

}