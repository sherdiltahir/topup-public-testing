import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:topup/ModelClasses/UserModel.dart';

class DatabaseService {
  String otherUid;
  String shipmentId;

  DatabaseService();

  // collection reference
  final CollectionReference usersCollection =
      Firestore.instance.collection('Users');


  Future<void> setUserData(User user) async {
    return await usersCollection.document(user.id).setData(user.toMap());
  }


  List<User> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((snapshot) {
      return _userDataFromSnapshot(snapshot);
    }).toList();
  }


  User _userDataFromSnapshot(DocumentSnapshot snapshot) {
    User newUser = User();
    newUser.fromMap(snapshot);
    return newUser;
  }

  Stream<User> getCurrentUserData(User user) {
    return usersCollection.document(user.id).snapshots().map(_userDataFromSnapshot);
  }



  Stream<User> getOtherUserData(String id) {
    return usersCollection.document(id).snapshots().map(_userDataFromSnapshot);
  }

}
