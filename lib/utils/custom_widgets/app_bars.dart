import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color.dart';
import '../size_config.dart';
import '../strings.dart';

AppBar appBar_withNoTitle(BuildContext context){
return AppBar(
  backgroundColor: Colors.white,
  elevation: 0,
  leading: IconButton(
    onPressed: (){
      Navigator.pop(context);
    },
    icon:Icon(
      Icons.arrow_back_ios,
      color: darkGreyColor,
      size: 4 * SizeConfig.imageSizeMultiplier,
    ),
  )
);

}

Widget appBar_withHelp(BuildContext context, String title){
  return PreferredSize(
      preferredSize: AppBar().preferredSize,
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon:Icon(
                Icons.arrow_back_ios,
                color: darkGreyColor,
                size: 4 * SizeConfig.imageSizeMultiplier,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                  color: darkGreyColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 2.2 * SizeConfig.textMultiplier),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
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
        ),
      ),
  );
}

Widget appBar_withTitle(BuildContext context, String title){
  return PreferredSize(
    preferredSize: AppBar().preferredSize,
    child: Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon:Icon(
              Icons.arrow_back_ios,
              color: darkGreyColor,
              size: 4 * SizeConfig.imageSizeMultiplier,
            ),
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
                color: darkGreyColor,
                fontWeight: FontWeight.w400,
                fontSize: 2.2 * SizeConfig.textMultiplier),
          ),
        ],
      ),
    ),
  );
}