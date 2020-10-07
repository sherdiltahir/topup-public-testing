import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color.dart';
import '../size_config.dart';

Widget CustomSnackBar(String msg){
  return  SnackBar(
    backgroundColor: themeColor,
    content: new Text(msg,
        style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 1.8 * SizeConfig.textMultiplier)),
  );
}