import 'package:firebase_auth/firebase_auth.dart';
import 'package:topup/ModelClasses/UserModel.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId='';

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(id: user.uid) : null;
  }


  Future<String> currentUserIdFromAuth() async {
    final FirebaseUser user = await _auth.currentUser();
    if (user!=null) {
      final String uid = user.uid;
      if (uid.isNotEmpty)
        return uid;
     }
    return "";

  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
    .map(_userFromFirebaseUser);
  }

  // sign in anon





  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user.uid;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<void> verifyPhone(String userPhoneNumber) async {
    final PhoneVerificationCompleted verified =
        (AuthCredential authResult) async {
      _signInWithPhoneNumber(authResult);
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String varId) {
      this.verificationId = varId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: userPhoneNumber,
        timeout: const Duration(seconds: 50),
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }

  void _signInWithPhoneNumber(AuthCredential credential) async {
    if (credential == null)
      credential = PhoneAuthProvider.getCredential(
          verificationId: verificationId, smsCode: enteredCode);

    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) async {
      if (value != null) {
        widget.driver.id = value.user.uid;
        isInfoOk = true;
      }
    });
    if (isInfoOk) {
      await DatabaseService(widget.driver.id)
          .updateDriverData(currentUser: widget.driver);
      gotoSignUp();
    }
    isInfoOk=false;
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
