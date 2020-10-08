import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/size_config.dart';
import 'package:topup/utils/strings.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 1.5 * SizeConfig.heightMultiplier,
          horizontal: 3.5 * SizeConfig.widthMultiplier),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: lightGreyColor,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 2.0,
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(8.0)
              ),
            ),
            padding:  EdgeInsets.symmetric(
                vertical: 1.5 * SizeConfig.heightMultiplier,
                horizontal: 1.5 * SizeConfig.widthMultiplier),
            child: Text(
              Strings.privacy_policy,
              textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                  color: darkGreyColor,
                  fontSize: 1.7 * SizeConfig.textMultiplier,
                  fontWeight: FontWeight.normal),
            ),
          )
          ),
    );
  }
}
