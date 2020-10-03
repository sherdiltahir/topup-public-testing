import 'package:firebase_auth/firebase_auth.dart';
import 'package:topup/ModelClasses/UserModel.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = '';

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(id: user.uid) : null;
  }

  Future<String> currentUserIdFromAuth() async {
    final FirebaseUser user = await _auth.currentUser();
    if (user != null) {
      final String uid = user.uid;
      if (uid.isNotEmpty) return uid;
    }
    return "";
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  Future<void> verifyPhone(String userPhoneNumber, Function goToNextScreen,
      Function smsUIUpdate, Function updateUser) async {
    final PhoneVerificationCompleted verified =
        (AuthCredential authResult) async {
      _signInWithPhoneNumber(authResult, '', updateUser);
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      smsUIUpdate(false);//False means that the the sms has just been sent wait for 50 seconds and start countdown
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String varId) {
      this.verificationId = varId;
      smsUIUpdate(true);//True means show the resend button
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: userPhoneNumber,
        timeout: const Duration(seconds: 50),
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }

  Future<bool> _signInWithPhoneNumber(AuthCredential credential,
      String enteredCode, Function updateUser) async {
    if (credential == null) if (enteredCode != null)
      credential = PhoneAuthProvider.getCredential(
          verificationId: verificationId, smsCode: enteredCode);
    else
      return false;

    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) async {
      if (value != null) {
        updateUser(value.user.uid);
      }
    });
    return true;
  }

// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
