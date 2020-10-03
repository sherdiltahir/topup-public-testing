import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/images.dart';
import 'package:topup/utils/size_config.dart';
import 'package:topup/utils/strings.dart';

class CreatePin extends StatefulWidget {
  @override
  _CreatePinState createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
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
                Strings.set_pin_String,
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

          ],
        ),
      ),
    );
  }
}
