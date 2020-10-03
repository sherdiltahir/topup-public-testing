import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/images.dart';
import 'package:topup/utils/numeric_pad.dart';
import 'package:topup/utils/size_config.dart';
import 'package:topup/utils/strings.dart';

class ReEnterPin extends StatefulWidget {
  @override
  _ReEnterPinState createState() => _ReEnterPinState();
}

class _ReEnterPinState extends State<ReEnterPin> {
  String pin= "";

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
                Strings.reenter_pin_String,
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
                Strings.secure_payment_String,
                style: GoogleFonts.poppins(
                    color: darkGreyColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 1.45 * SizeConfig.textMultiplier),
              ),
            ),
            SizedBox(
              height: 8 * SizeConfig.heightMultiplier,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCircles(),
                buildCircles(),
                buildCircles(),
                buildCircles(),
                buildCircles(),
                buildCircles(),
              ],
            ),

            SizedBox(
              height: 8 * SizeConfig.heightMultiplier,
            ),

            NumericPad(
              onNumberSelected: (value) {
                print(value);
                setState(() {
                  if(value != -1){
                    if(pin.length < 4){
                      pin = pin + value.toString();
                    }
                  }
                  else{
                    pin = pin.substring(0, pin.length - 1);
                  }
                  print(pin);
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}

Widget buildCircles() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 1 * SizeConfig.widthMultiplier),
    child: SizedBox(
      width: 4 * SizeConfig.widthMultiplier,
      height: 2 * SizeConfig.heightMultiplier,
      child: Container(
        decoration: BoxDecoration(
          color: lightGreyColor,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          boxShadow: <BoxShadow>[

          ],
        ),
      ),
    ),
  );
}
