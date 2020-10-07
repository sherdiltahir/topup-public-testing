import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/custom_widgets/app_bars.dart';
import 'package:topup/utils/icons.dart';
import 'package:topup/utils/size_config.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: dashboardAppBar_settings(context, "Settings"),
        body: SafeArea(
          child: Scaffold(
            body:ListView(
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    leading: SvgPicture.asset(profile_Icon,color: darkGreyColor,height: 3*SizeConfig.heightMultiplier,width: 3*SizeConfig.widthMultiplier,),
                    title:  Text(
                    "My Profile",
                    style: GoogleFonts.poppins(
                        color: darkGreyColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 2.0 * SizeConfig.textMultiplier),
                  ),
                    trailing: IconButton(
                      onPressed: (){},
                      icon:Icon(Icons.arrow_forward_ios,color: darkGreyColor,size: 5*SizeConfig.imageSizeMultiplier,),),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    leading: SvgPicture.asset(password_Icon,color: darkGreyColor,height: 3.5*SizeConfig.heightMultiplier,width: 3.5*SizeConfig.widthMultiplier,),
                    title:  Text(
                      "Change PIN",
                      style: GoogleFonts.poppins(
                          color: darkGreyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 2.0 * SizeConfig.textMultiplier),
                    ),
                    trailing: IconButton(
                      onPressed: (){},
                      icon:Icon(Icons.arrow_forward_ios,color: darkGreyColor,size: 5*SizeConfig.imageSizeMultiplier,),),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    leading: SvgPicture.asset(translation_Icon,height: 3.5*SizeConfig.heightMultiplier,width: 3.5*SizeConfig.widthMultiplier,),
                    title:  Text(
                      "Change Language",
                      style: GoogleFonts.poppins(
                          color: darkGreyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 2.0 * SizeConfig.textMultiplier),
                    ),
                    trailing: IconButton(
                      onPressed: (){},
                      icon:Icon(Icons.arrow_forward_ios,color: darkGreyColor,size: 5*SizeConfig.imageSizeMultiplier,),),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    leading: SvgPicture.asset(question_Icon,color: darkGreyColor,height: 3*SizeConfig.heightMultiplier,width: 3*SizeConfig.widthMultiplier,),
                    title:  Text(
                      "Help & Support",
                      style: GoogleFonts.poppins(
                          color: darkGreyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 2.0 * SizeConfig.textMultiplier),
                    ),
                    trailing: IconButton(
                      onPressed: (){},
                      icon:Icon(Icons.arrow_forward_ios,color: darkGreyColor,size: 5*SizeConfig.imageSizeMultiplier,),),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: ListTile(
                    leading: SvgPicture.asset(logout_Icon,color: darkGreyColor,height: 3*SizeConfig.heightMultiplier,width: 3*SizeConfig.widthMultiplier,),
                    title:  Text(
                      "Logout",
                      style: GoogleFonts.poppins(
                          color: darkGreyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 2.0 * SizeConfig.textMultiplier),
                    ),
                    trailing: IconButton(
                      onPressed: (){},
                      icon:Icon(Icons.arrow_forward_ios,color: darkGreyColor,size: 5*SizeConfig.imageSizeMultiplier,),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
