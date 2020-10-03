import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topup/screens/registration/pin.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/images.dart';
import 'package:topup/utils/size_config.dart';
import 'package:topup/utils/strings.dart';

class VerifyPhone extends StatefulWidget {

  final String phoneNumber;

  VerifyPhone({@required this.phoneNumber});

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {

  String code = "123456";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: (){

          },
          child: Icon(
            Icons.arrow_back_ios,
            color: darkGreyColor,
            size: 4 * SizeConfig.imageSizeMultiplier,
          ),
        ),

        title: Text(
          "Mobile Number Verification",
          style: GoogleFonts.poppins(
              color: darkGreyColor,
              fontWeight: FontWeight.w400,
              fontSize: 2.2 * SizeConfig.textMultiplier),
        ),
      ),
      body: Container(
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
              height: 8 * SizeConfig.heightMultiplier,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  buildCodeNumberBox(code.length > 0 ? code.substring(0, 1) : ""),
                  buildCodeNumberBox(code.length > 1 ? code.substring(1, 2) : ""),
                  buildCodeNumberBox(code.length > 2 ? code.substring(2, 3) : ""),
                  buildCodeNumberBox(code.length > 3 ? code.substring(3, 4) : ""),
                  buildCodeNumberBox(code.length > 4 ? code.substring(4, 5) : ""),
                  buildCodeNumberBox(code.length > 5 ? code.substring(5, 6) : ""),

                ],
              ),
            ),
            SizedBox(
              height: 6 * SizeConfig.heightMultiplier,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
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
                    "56 sec",
                    style: GoogleFonts.poppins(
                        color: darkGreyColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 1.7 * SizeConfig.textMultiplier),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10 * SizeConfig.heightMultiplier,
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(
                      builder:(context)=>CreatePin()
                  ));
                },
                child: Text(
                  Strings.need_help_String,
                  style: GoogleFonts.poppins(
                      color: blueColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 2.2 * SizeConfig.textMultiplier),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1*SizeConfig.widthMultiplier),
      child: SizedBox(
        width: 10*SizeConfig.widthMultiplier,
        height: 5*SizeConfig.heightMultiplier,
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
                  offset: Offset(0.0, 0.75)
              )
            ],
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: GoogleFonts.poppins(
                fontSize: 1.8*SizeConfig.textMultiplier,
                fontWeight: FontWeight.bold,
                color: darkGreyColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
