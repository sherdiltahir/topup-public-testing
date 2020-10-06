import 'package:flutter/material.dart';
import 'package:credit_card_input_form/credit_card_input_form.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topup/ModelClasses/UserModel.dart';
import 'package:topup/screens/registration/add_profile.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/images.dart';
import 'package:topup/utils/size_config.dart';
import 'package:topup/utils/strings.dart';

class Add_Card extends StatefulWidget {
  @override
  _Add_CardState createState() => _Add_CardState();
}

class _Add_CardState extends State<Add_Card> {
  final Map<String, String> customCaptions = {
    'PREV': 'Prev',
    'NEXT': 'Next',
    'DONE': 'Done',
    'CARD_NUMBER': 'Card Number',
    'CARDHOLDER_NAME': 'Cardholder Name',
    'VALID_THRU': 'Valid Thru',
    'SECURITY_CODE_CVC': 'Security Code (CVC)',
    'NAME_SURNAME': 'Name Surname',
    'MM_YY': 'MM/YY',
    'RESET': 'Reset',
  };

  final buttonStyle2 = BoxDecoration(
      color: themeColor,
      borderRadius: BorderRadius.circular(10.0),

      );

  final buttonStyle = BoxDecoration(
    color: themeColor,
    borderRadius: BorderRadius.circular(10.0),
  );

  final buttonTextStyle = GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 1.8 * SizeConfig.textMultiplier);

  final cardDecoration = BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black54, blurRadius: 8.0, offset: Offset(0, 6))
      ],
      gradient: LinearGradient(
          colors: [
            themeColor,
            Colors.blue[200],
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
      borderRadius: BorderRadius.all(Radius.circular(15)));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        ),
        body: Form(
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 1.5 * SizeConfig.heightMultiplier,
            ),
            child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 3.5 * SizeConfig.widthMultiplier),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Strings.add_card_String,
                    style: GoogleFonts.poppins(
                        color: darkGreyColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 2.2 * SizeConfig.textMultiplier),
                  ),
                ),
                SizedBox(
                  height: 1 * SizeConfig.heightMultiplier,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 3.5 * SizeConfig.widthMultiplier),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Strings.add_card_details_String,
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
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    child: Stack(children: [
                      CreditCardInputForm(

                        showResetButton: true,
                        onStateChange: (currentState, cardInfo) {
                          print(currentState);
                          print(cardInfo);
                        },
                        customCaptions: customCaptions,
                        frontCardDecoration: cardDecoration,
                        backCardDecoration: cardDecoration,
                        nextButtonDecoration: buttonStyle,
                        prevButtonDecoration: buttonStyle,
                        resetButtonDecoration: buttonStyle,
                        // prevButtonTextStyle: buttonTextStyle,
                        // nextButtonTextStyle: buttonTextStyle,
                        // resetButtonTextStyle: buttonTextStyle,
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 12 * SizeConfig.heightMultiplier,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Skip',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: blueColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 2.8 * SizeConfig.textMultiplier),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
