import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:topup/ModelClasses/UserModel.dart';
import 'package:topup/Services/FirebaseAuthService.dart';
import 'package:topup/Services/FirebaseDatabaseService.dart';
import 'package:topup/screens/dashboard/dashboard.dart';
import 'package:topup/screens/registration/pin.dart';
import 'package:topup/screens/registration/re_enter_pin.dart';
import 'package:topup/screens/registration/security_questions.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/custom_widgets/app_bars.dart';
import 'package:topup/utils/custom_widgets/numeric_pad.dart';
import 'package:topup/utils/images.dart';
import 'package:topup/utils/size_config.dart';
import 'package:topup/utils/strings.dart';

class VerifyPhone extends StatefulWidget {
  VerifyPhone();

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  AuthService _auth = new AuthService();
  DatabaseService databaseService = new DatabaseService();
  User user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      user = Provider.of<User>(context, listen: false);
      _auth.verifyPhone(user.phoneNumber, smsUIUpdate, updateUser);
    });
    //startTimer();
  }

  Timer _timer;
  int _start = 60;

  double _progress = 0.2;

  String _code = "";

  bool _error = false;
  bool timer = true;
  bool _phone_verified = true;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  void smsUIUpdate(bool showResent) {
    if (showResent) {
      setState(() {
        timer = false;
        _timer.cancel();
      });
    } else {
      setState(() {
        _start = 60;
        startTimer();
        timer = true;
      });
    }
  }

  void updateUser(String userId) async {
    user.id = userId;
    goToNextScreen();
  }

  void goToCreatePinScreen() {
    print('We are clear to sign up Hello world');
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CreatePin()));
  }

  void goToNextScreen() {
    setState(() {
      timer = false;
      _timer.cancel();
    });
    StreamSubscription subscription;
    subscription =
        databaseService.getCurrentUserData(user).listen((event) async {
      subscription.cancel();
      if (event == null) {
        await databaseService.setUserData(user);
        goToCreatePinScreen();
      } else {
        user.fromUser(event);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      }
      setState(() {
        _phone_verified = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar_withTitle(context, "Mobile Number Verification"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: 2 * SizeConfig.heightMultiplier,
              horizontal: 4.5 * SizeConfig.widthMultiplier),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Strings.verification_code_String,
                  style: GoogleFonts.poppins(
                      color: darkGreyColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 2.2 * SizeConfig.textMultiplier),
                ),
              ),
              SizedBox(
                height: 1 * SizeConfig.heightMultiplier,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Strings.verification_code_digit_String,
                  style: GoogleFonts.poppins(
                      color: darkGreyColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 1.45 * SizeConfig.textMultiplier),
                ),
              ),
              SizedBox(
                height: 6 * SizeConfig.heightMultiplier,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildCodeNumberBox(
                        _code.length > 0 ? _code.substring(0, 1) : ""),
                    buildCodeNumberBox(
                        _code.length > 1 ? _code.substring(1, 2) : ""),
                    buildCodeNumberBox(
                        _code.length > 2 ? _code.substring(2, 3) : ""),
                    buildCodeNumberBox(
                        _code.length > 3 ? _code.substring(3, 4) : ""),
                    buildCodeNumberBox(
                        _code.length > 4 ? _code.substring(4, 5) : ""),
                    buildCodeNumberBox(
                        _code.length > 5 ? _code.substring(5, 6) : ""),
                  ],
                ),
              ),
              SizedBox(
                height: 3 * SizeConfig.heightMultiplier,
              ),
              _error == false
                  ? SizedBox(
                      height: 3 * SizeConfig.heightMultiplier,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Incorrect code",
                            style: GoogleFonts.poppins(
                                color: errorColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 1.7 * SizeConfig.textMultiplier),
                          ),
                        ),
                        SizedBox(
                          height: 2 * SizeConfig.heightMultiplier,
                        )
                      ],
                    ),
              Align(
                alignment: Alignment.centerLeft,
                child: timer == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Strings.request_new_code_String,
                            style: GoogleFonts.poppins(
                                color: darkGreyColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 1.45 * SizeConfig.textMultiplier),
                          ),
                          Text(
                            "$_start sec",
                            style: GoogleFonts.poppins(
                                color: darkGreyColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 1.7 * SizeConfig.textMultiplier),
                          )
                        ],
                      )
                    : Align(
                        alignment: Alignment.center,
                        child: MaterialButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.5 * SizeConfig.heightMultiplier,
                              horizontal: 30 * SizeConfig.widthMultiplier),
                          color: themeColor,
                          elevation: 4.0,
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                                // MaterialPageRoute(
                                //     builder: (context) => SecurityQuestions()));
                            setState(() {
                              _auth.verifyPhone(user.phoneNumber, smsUIUpdate, updateUser);
                            });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0))),
                          child: Text(
                            "Resend code",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 2.1 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
              ),
              SizedBox(
                height: 2.5 * SizeConfig.heightMultiplier,
              ),
              // Align(
              //   alignment: Alignment.center,
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => ReEnterPin()));
              //     },
              //     child: Text(
              //       Strings.need_help_String,
              //       style: GoogleFonts.poppins(
              //           color: blueColor,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 2.2 * SizeConfig.textMultiplier),
              //     ),
              //   ),
              // ),
              NumericPad(
                onNumberSelected: (value) async {
                  if (_error)
                  setState(() {
                  _error = false;
                  });

                  setState(() {
                    if (value != -1) {
                      if (_code.length < 6) {
                        _code = _code + value.toString();
                      }
                    } else {
                      _code = _code.substring(0, _code.length - 1);
                    }
                  });
                  if (_code.length == 6) {
                    setState(() {
                    _phone_verified = false;
                    });
                    setLoading();
                  }
                },
              ),
              SizedBox(
                height: 3 * SizeConfig.heightMultiplier,
              ),
              _phone_verified == false
                  ? CircularProgressIndicator(
                      // value: _progress,
                      valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                    )
                  : SizedBox(
                      height: 1 * SizeConfig.heightMultiplier,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1 * SizeConfig.widthMultiplier),
      child: SizedBox(
        width: 10 * SizeConfig.widthMultiplier,
        height: 5 * SizeConfig.heightMultiplier,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8.0,
                  spreadRadius: 0.5,
                  offset: Offset(0.0, 0.75))
            ],
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: GoogleFonts.poppins(
                fontSize: 1.75 * SizeConfig.textMultiplier,
                fontWeight: FontWeight.bold,
                color: darkGreyColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> setLoading() async {
    if (!await _auth.signInWithPhoneNumber(null, _code, updateUser)) {
      setState(() {
        _error = true;
      });
    }
    else{
      setState(() {
        _phone_verified = true;
      });
    }
  }
}
