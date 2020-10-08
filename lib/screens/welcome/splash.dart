import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:topup/ModelClasses/UserModel.dart';
import 'package:topup/Services/FirebaseAuthService.dart';
import 'package:topup/Services/FirebaseDatabaseService.dart';
import 'package:topup/screens/dashboard/dashboard.dart';
import 'package:topup/screens/login/login.dart';
import 'package:topup/screens/registration/register.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/size_config.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String userId = '';
  User currentUser;
  User user;

  void moveToDashboard() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Dashboard()));
  }

  void moveToOnBoarding() {
    // Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  void navigateToOnBoard() {
    Timer(Duration(seconds: 3), moveToOnBoarding);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      user = Provider.of<User>(context, listen: false);
      checkAuthentication();
    });
  }

  void checkAuthentication() async {
    var _authService = AuthService();
    userId = await _authService.currentUserIdFromAuth();
    if (userId != '') {
      DatabaseService().getOtherUserData(userId).listen((event) {
        currentUser = event;
        if (currentUser != null && currentUser.name != null) {
          user.fromUser(currentUser);
          Timer(Duration(seconds: 2), moveToDashboard);
        } else {
          navigateToOnBoard();
        }
      });
    } else {
      navigateToOnBoard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              height: 12 * SizeConfig.heightMultiplier,
              width: 20 * SizeConfig.widthMultiplier,
              color: themeColor,
            ),
          ),
        ),
      ),
    );
  }
}
