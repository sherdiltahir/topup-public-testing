import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  FirebaseStorage storage = FirebaseStorage.instance;

//Path is the main folder
  //FileName is the sub folder
  Future<String> uploadUserProfile(
      File fileToUpload, String path, String fileName) async {
    StorageTaskSnapshot snapshot = await storage
        .ref()
        .child("$path/$fileName")
        .putFile(fileToUpload)
        .onComplete;
    if (snapshot.error == null) {
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    }
    return null;
  }
}
