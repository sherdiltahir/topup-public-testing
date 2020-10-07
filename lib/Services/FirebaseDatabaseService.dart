import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:topup/ModelClasses/Complains.dart';
import 'package:topup/ModelClasses/CouponSharingModel.dart';
import 'package:topup/ModelClasses/CouponsAvailable.dart';
import 'package:topup/ModelClasses/CouponsModel.dart';
import 'package:topup/ModelClasses/CouponsTransaction.dart';
import 'package:topup/ModelClasses/FuelTransaction.dart';
import 'package:topup/ModelClasses/OperatorModel.dart';
import 'package:topup/ModelClasses/PetrolPumpModel.dart';
import 'package:topup/ModelClasses/UserModel.dart';

class DatabaseService {
  DatabaseService();

  // collection reference
  final CollectionReference usersCollection =
      Firestore.instance.collection('Users');

  Future<void> setUserData(User user) async {
    return await usersCollection.document(user.id).setData(user.toMap());
  }

  User _userDataFromSnapshot(DocumentSnapshot snapshot) {
    User newUser = User();
    if (!snapshot.exists)
      return null;
      newUser.fromMap(snapshot);
    return newUser;
  }

  Stream<User> getCurrentUserData(User user) {
    return usersCollection
        .document(user.id)
        .snapshots()
        .map(_userDataFromSnapshot);
  }

  Stream<User> getOtherUserData(String id) {
    return usersCollection.document(id).snapshots().map(_userDataFromSnapshot);
  }

  //Petrol Pump Queries
  final CollectionReference petrolPumpCollection =
      Firestore.instance.collection('PetrolPump');

  Stream<List<PetrolPump>> getAllPetrolPumps() {
    return petrolPumpCollection.snapshots().map(_petrolPumpListFromSnapshot);
  }

  Stream<PetrolPump> getSelectedPetrolPump(String id) {
    return petrolPumpCollection
        .document(id)
        .snapshots()
        .map(_petrolPumpDataFromSnapshot);
  }

  List<PetrolPump> _petrolPumpListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return _petrolPumpDataFromSnapshot(doc);
    }).toList();
  }

  PetrolPump _petrolPumpDataFromSnapshot(DocumentSnapshot doc) {
    PetrolPump current = PetrolPump();
    current.fromMap(doc);
    return current;
  }

  //Operator Queries
  final CollectionReference operatorsCollection =
      Firestore.instance.collection('Operators');

  Stream<Operator> getSelectedOperator(String id) {
    return operatorsCollection
        .document(id)
        .snapshots()
        .map(_operatorDataFromSnapshot);
  }

  Operator _operatorDataFromSnapshot(DocumentSnapshot doc) {
    Operator current = Operator();
    current.fromMap(doc);
    return current;
  }

  //Complains Queries
  final CollectionReference complainsCollection =
      Firestore.instance.collection('Complains');

  Stream<List<Complain>> getSelectedUserComplains(String id) {
    return complainsCollection
        .where('complainantId', isEqualTo: id)
        .where('complainantId', isEqualTo: 'User')
        .snapshots()
        .map(_complainDataListFromSnapshot);
  }

  List<Complain> _complainDataListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return _complainDataFromSnapshot(doc);
    }).toList();
  }

  Complain _complainDataFromSnapshot(DocumentSnapshot doc) {
    Complain current = Complain();
    current.fromMap(doc);
    return current;
  }

  Future<void> setComplainData(Complain complain) async {
    return await complainsCollection
        .document(complain.complainId)
        .setData(complain.toMap());
  }

  //AvailableCouponsQueries
  final CollectionReference availableCouponsCollection =
      Firestore.instance.collection('AvailableCoupons');

  Stream<List<CouponsAvailable>> getAllAvailableCoupons() {
    return availableCouponsCollection
        .snapshots()
        .map(_couponAvailableDataListFromSnapshot);
  }

  List<CouponsAvailable> _couponAvailableDataListFromSnapshot(
      QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return _couponAvailableDataFromSnapshot(doc);
    }).toList();
  }

  CouponsAvailable _couponAvailableDataFromSnapshot(DocumentSnapshot doc) {
    CouponsAvailable current = CouponsAvailable();
    current.fromMap(doc);
    return current;
  }

  //CouponsDetails
  final CollectionReference couponsCollection =
      Firestore.instance.collection('Coupons');

  Stream<List<Coupon>> getAllCouponsForUser(String id) {
    return couponsCollection
        .where("currentOwnerId", isEqualTo: id)
        .snapshots()
        .map(_couponDataListFromSnapshot);
  }

  List<Coupon> _couponDataListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return _couponDataFromSnapshot(doc);
    }).toList();
  }

  Coupon _couponDataFromSnapshot(DocumentSnapshot doc) {
    Coupon current = Coupon();
    current.fromMap(doc);
    return current;
  }

  Future<void> setCouponData(Coupon coupon) async {
    return await couponsCollection
        .document(coupon.couponId)
        .setData(coupon.toMap());
  }

  //CouponsSharingQueries
  final CollectionReference couponSharingCollection =
      Firestore.instance.collection('CouponsSharing');

  Stream<List<CouponSharing>> getAllCouponTransactionsSentByUser(String id) {
    return couponSharingCollection
        .where("sentBy", isEqualTo: id)
        .snapshots()
        .map(_couponSharingDataListFromSnapshot);
  }

  Stream<List<CouponSharing>> getAllCouponTransactionsReceivedByUser(
      String id) {
    return couponSharingCollection
        .where("sentTo", isEqualTo: id)
        .snapshots()
        .map(_couponSharingDataListFromSnapshot);
  }

  List<CouponSharing> _couponSharingDataListFromSnapshot(
      QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return _couponSharingDataFromSnapshot(doc);
    }).toList();
  }

  CouponSharing _couponSharingDataFromSnapshot(DocumentSnapshot doc) {
    CouponSharing current = CouponSharing();
    current.fromMap(doc);
    return current;
  }

  Future<void> setCouponSharingData(CouponSharing coupon) async {
    return await couponSharingCollection
        .document(coupon.couponId)
        .setData(coupon.toMap());
  }

  //FuelTransactionQueries
  final CollectionReference fuelTransactionCollection =
      Firestore.instance.collection('FuelTransaction');

  Stream<List<FuelTransaction>> getAllFuelTransactionsForUser(String id) {
    return fuelTransactionCollection
        .where("userId", isEqualTo: id)
        .snapshots()
        .map(_fuelTransactionDataListFromSnapshot);
  }

  Stream<FuelTransaction> getParticularFuelTransaction(String id) {
    return fuelTransactionCollection
        .document(id)
        .snapshots()
        .map(_fuelTransactionDataFromSnapshot);
  }

  List<FuelTransaction> _fuelTransactionDataListFromSnapshot(
      QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return _fuelTransactionDataFromSnapshot(doc);
    }).toList();
  }

  FuelTransaction _fuelTransactionDataFromSnapshot(DocumentSnapshot doc) {
    FuelTransaction current = FuelTransaction();
    current.fromMap(doc);
    return current;
  }

  Future<void> setFuelTransactionData(FuelTransaction transaction) async {
    return await fuelTransactionCollection
        .document(transaction.transactionId)
        .setData(transaction.toMap());
  }

  //CouponsTransactionQueries
  final CollectionReference couponTransactionCollection =
      Firestore.instance.collection('CouponTransaction');

  Stream<List<CouponsTransaction>> getAllCouponTransactionsForUser(String id) {
    return couponTransactionCollection
        .where("userId", isEqualTo: id)
        .snapshots()
        .map(_couponTransactionDataListFromSnapshot);
  }

  Stream<CouponsTransaction> getParticularCouponTransaction(String id) {
    return couponTransactionCollection
        .document(id)
        .snapshots()
        .map(_couponTransactionDataFromSnapshot);
  }

  List<CouponsTransaction> _couponTransactionDataListFromSnapshot(
      QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return _couponTransactionDataFromSnapshot(doc);
    }).toList();
  }

  CouponsTransaction _couponTransactionDataFromSnapshot(DocumentSnapshot doc) {
    CouponsTransaction current = CouponsTransaction();
    current.fromMap(doc);
    return current;
  }

  Future<void> setCouponTransactionData(CouponsTransaction transaction) async {
    return await couponTransactionCollection
        .document(transaction.transactionId)
        .setData(transaction.toMap());
  }
}
