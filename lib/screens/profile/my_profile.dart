import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topup/screens/settings/help_centre.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/custom_widgets/app_bars.dart';
import 'package:topup/utils/icons.dart';
import 'package:topup/utils/size_config.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  List<Grid_Item> items = [
    new Grid_Item(cards_Icon, "My Cards", "2"),
    new Grid_Item(friends_Icon, "My Friends", "5")
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: themeColor,
          statusBarIconBrightness: Brightness.light),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: help_Support_Appbar(context, "My Profile"),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileCard(),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: EdgeInsets.only(top: 25*SizeConfig.heightMultiplier,bottom: 5*SizeConfig.heightMultiplier),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GridView_Item(items[0]),
                      GridView_Item(items[1]),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget ProfileCard() {
    return Container(
      width: 100 * SizeConfig.widthMultiplier,
      height: 25 * SizeConfig.heightMultiplier,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            width: 100 * SizeConfig.widthMultiplier,
            height: 25 * SizeConfig.heightMultiplier,
            decoration: BoxDecoration(
              color: themeColor,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(150.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 2.0,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -100,
            right: 0,
            left: 0,
            child: Align(
              alignment: Alignment(0, 1),
              child: Container(
                width: 72 * SizeConfig.widthMultiplier,
                height: 33 * SizeConfig.heightMultiplier,
                padding: EdgeInsets.symmetric(
                    vertical: 1.5 * SizeConfig.heightMultiplier,
                    horizontal: 2 * SizeConfig.widthMultiplier),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 2.0,
                      ),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProfileAvatar(
                      "https://i.pravatar.cc/300",
                      borderWidth: 6.0,
                      radius: 50.0,
                      backgroundColor: themeColor,
                      borderColor: themeColor,
                      cacheImage: true,
                      foregroundColor: themeColor.withOpacity(0.5),
                      elevation: 4.0,
                    ),
                    SizedBox(
                      height: 2 * SizeConfig.heightMultiplier,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 10 * SizeConfig.widthMultiplier),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      "John Smith",
                                      style: GoogleFonts.poppins(
                                          color: darkGreyColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              2.2 * SizeConfig.textMultiplier),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1 * SizeConfig.heightMultiplier,
                                  ),
                                  Center(
                                    child: Text(
                                      "+7 334445355",
                                      style: GoogleFonts.poppins(
                                          color: darkGreyColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize:
                                              2.2 * SizeConfig.textMultiplier),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: darkGreyColor,
                              size: 5.5 * SizeConfig.imageSizeMultiplier,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget GridView_Item(Grid_Item item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10*SizeConfig.widthMultiplier,vertical: 1.5*SizeConfig.heightMultiplier),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 1.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(item.icon,height: 12*SizeConfig.heightMultiplier,width: 12*SizeConfig.widthMultiplier,),
          SizedBox(height: 0.5*SizeConfig.heightMultiplier,),
          Text(
            item.title,
            style: GoogleFonts.poppins(
                color: darkGreyColor,
                fontWeight: FontWeight.normal,
                fontSize:
                2.0 * SizeConfig.textMultiplier),
          ),
          SizedBox(height: 0.5*SizeConfig.heightMultiplier,),
          Text(
            item.qty,
            style: GoogleFonts.poppins(
                color: darkGreyColor,
                fontWeight: FontWeight.bold,
                fontSize:
                3.0 * SizeConfig.textMultiplier),
          )
        ],
      ),
    );
  }
}

class Grid_Item {
  final String icon;
  final String title;
  final String qty;

  Grid_Item(this.icon, this.title, this.qty);
}
