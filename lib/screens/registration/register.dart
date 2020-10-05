import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topup/screens/registration/phone_verify.dart';
import 'package:topup/screens/registration/pin.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/images.dart';
import 'package:topup/utils/size_config.dart';
import 'package:topup/utils/strings.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.arrow_back_ios,
            color: darkGreyColor,
            size: 4 * SizeConfig.imageSizeMultiplier,
          ),
        ),
        actions: [
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  0, 0, 2.0 * SizeConfig.widthMultiplier, 0),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  Strings.need_help_String,
                  style: GoogleFonts.poppins(
                      color: themeColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 2.2 * SizeConfig.textMultiplier),
                ),
              ),
            ),
          )
        ],
        title: Text(
          "Register",
          style: GoogleFonts.poppins(
              color: darkGreyColor,
              fontWeight: FontWeight.w400,
              fontSize: 2.2 * SizeConfig.textMultiplier),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            vertical: 1.5 * SizeConfig.heightMultiplier,
            horizontal: 3.5 * SizeConfig.widthMultiplier),
        child: SingleChildScrollView(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                  mobile_Image,
                  height: 8.5 * SizeConfig.heightMultiplier,
                  width: 8.5 * SizeConfig.widthMultiplier,
                  color: themeColor,
                ),
              ),
              SizedBox(
                height: 1.5 * SizeConfig.heightMultiplier,
              ),
              Center(
                child: Text(
                  Strings.mobile_number_String,
                  style: GoogleFonts.poppins(
                      color: darkGreyColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 2.2 * SizeConfig.textMultiplier),
                ),
              ),
              SizedBox(
                height: 1 * SizeConfig.heightMultiplier,
              ),
              Center(
                child: Text(
                  Strings.mobile_verfication_String,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: darkGreyColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 1.6 * SizeConfig.textMultiplier),
                ),
              ),
              SizedBox(
                height: 3 * SizeConfig.heightMultiplier,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 3.5 * SizeConfig.widthMultiplier),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "+7",
                        style: GoogleFonts.poppins(
                            color: darkGreyColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 2.0 * SizeConfig.textMultiplier),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3 * SizeConfig.widthMultiplier),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            style: GoogleFonts.poppins(
                                color: darkGreyColor,
                                fontSize: 2.0 * SizeConfig.textMultiplier),
                            decoration: InputDecoration(
                                hintText: Strings.mobile_hint_String),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5 * SizeConfig.heightMultiplier,
              ),
              MaterialButton(
                padding: EdgeInsets.symmetric(
                    vertical: 1.2 * SizeConfig.heightMultiplier,
                    horizontal: 30 * SizeConfig.widthMultiplier),
                color: themeColor,
                elevation: 4.0,
                onPressed: () {
                  //Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          // VerifyPhone()
                          CreatePin()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                child: Text(
                  "Register",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 2.1 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 2.5 * SizeConfig.heightMultiplier,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.already_account_String,
                    style: GoogleFonts.poppins(
                        fontSize: 1.6 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.w400,
                        color: darkGreyColor),
                  ),
                  SizedBox(
                    width: 1 * SizeConfig.widthMultiplier,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                          fontSize: 2.2 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.bold,
                          color: darkGreyColor),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25 * SizeConfig.heightMultiplier,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  Strings.agree_String,
                  style: GoogleFonts.poppins(
                    color: darkGreyColor,
                    fontSize: 1.35 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
