import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topup/screens/settings/faq.dart';
import 'package:topup/screens/settings/help_centre.dart';
import 'package:topup/screens/settings/privacy_policy.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/custom_widgets/app_bars.dart';
import 'package:topup/utils/size_config.dart';

class Help_Support extends StatefulWidget {
  @override
  _Help_SupportState createState() => _Help_SupportState();
}

class _Help_SupportState extends State<Help_Support> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: help_Support_Appbar(context,"Help and Support"),
        body: DefaultTabController(
          length: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.5*SizeConfig.heightMultiplier),
                decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(32.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                child: TabBar(
                  unselectedLabelColor: Colors.white,
                  labelColor: darkGreyColor,
                  indicatorColor: darkGreyColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  dragStartBehavior: DragStartBehavior.start,


                  tabs: [
                    TabText("FAQ"),
                    TabText("Privacy Policy"),
                    TabText("Help Centre"),
                  ],

                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    //Container(color: Colors.amber,),
                    FAQ_Tab(),
                    PrivacyPolicy(),
                    HelpCentre(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Text TabText(String title){
    return Text(
      title,
       style: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 1.69 * SizeConfig.textMultiplier),
    );

  }
}
