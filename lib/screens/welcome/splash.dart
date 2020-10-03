import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:topup/screens/registration/register.dart';
import 'package:topup/screens/welcome/onboarding.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/size_config.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  void MoveToOnboarding() {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(
        builder:(context)=>Register(
    )));
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),MoveToOnboarding);
  }
  
  @override
  Widget build(BuildContext context) {
   return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
      ),
      child: SafeArea(
        child:  Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              height: 12*SizeConfig.heightMultiplier,
              width: 20*SizeConfig.widthMultiplier,
              color: themeColor,
            ),
          ),
        ),
      ),
    );
  }
}
