import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color.dart';
import '../size_config.dart';
import '../strings.dart';

AppBar appBar_withNoTitle(BuildContext context) {
  return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: darkGreyColor,
          size: 5 * SizeConfig.imageSizeMultiplier,
        ),
      ));
}

Widget appBar_withHelp(BuildContext context, String title) {
  return PreferredSize(
    preferredSize: AppBar().preferredSize,
    child: Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: darkGreyColor,
              size: 5 * SizeConfig.imageSizeMultiplier,
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
              margin: EdgeInsets.only(right: 1.0 * SizeConfig.widthMultiplier),
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

Widget appBar_withTitle(BuildContext context, String title) {
  return PreferredSize(
    preferredSize: AppBar().preferredSize,
    child: Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
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

AppBar dashboardAppbar_Home(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 2.2 * SizeConfig.textMultiplier),
    ),
    elevation: 0,
    backgroundColor: themeColor,
    actions: [
      IconButton(
        icon: Icon(
          Icons.notifications,
          color: Colors.white,
          size: 6.5 * SizeConfig.imageSizeMultiplier,
        ),
      )
    ],
  );
}

Widget dashboardAppBar_home(BuildContext context, String title) {
  return PreferredSize(
    preferredSize: AppBar().preferredSize,
    child: Container(
      color: themeColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 2 * SizeConfig.widthMultiplier),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 2.2 * SizeConfig.textMultiplier),
            ),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 6.5 * SizeConfig.imageSizeMultiplier,
                  ),
                )),
          )
        ],
      ),
    ),
  );
}

Widget dashboardAppBar_settings(BuildContext context, String title) {
  return PreferredSize(
    preferredSize: AppBar().preferredSize,
    child: Container(
      decoration: BoxDecoration(
        color: themeColor,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(24.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 2 * SizeConfig.widthMultiplier),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 2.2 * SizeConfig.textMultiplier),
            ),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 6.5 * SizeConfig.imageSizeMultiplier,
                  ),
                )),
          )
        ],
      ),
    ),
  );
}
