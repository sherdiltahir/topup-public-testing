import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topup/ModelClasses/UserModel.dart';
import 'package:topup/Services/FirebaseAuthService.dart';
import 'package:topup/Services/FirebaseDatabaseService.dart';
import 'package:topup/screens/registration/pin.dart';
import 'package:topup/screens/registration/re_enter_pin.dart';
import 'package:topup/screens/registration/security_questions.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/custom_widgets/app_bars.dart';
import 'package:topup/utils/custom_widgets/numeric_pad.dart';
import 'package:topup/utils/images.dart';
import 'package:topup/utils/size_config.dart';
import 'package:topup/utils/strings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: dashboardAppbar_Home(context, "Home"),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [
            Container(
              height: 6.5*SizeConfig.heightMultiplier,
              decoration: BoxDecoration(
                color: themeColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(24.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ]),
        ),
        //extendBodyBehindAppBar: true,
      ),
    );
  }
}
