import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/custom_widgets/app_bars.dart';
import 'package:topup/utils/size_config.dart';

class Loyalty_Points extends StatefulWidget {
  @override
  _Loyalty_PointsState createState() => _Loyalty_PointsState();
}

class _Loyalty_PointsState extends State<Loyalty_Points> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: dashboardAppbar_Main(context, "Loyalty Points"),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              height: 30 * SizeConfig.heightMultiplier,
              decoration: BoxDecoration(
                color: themeColor,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(150.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10 * SizeConfig.heightMultiplier,
            ),
            Center(
              child: Container(
                width: 80 * SizeConfig.widthMultiplier,
                height: 16 * SizeConfig.heightMultiplier,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: lightGreyColor,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 2.0,

                    )
                  ],
                    color: Colors.white,
                    border: Border.all(color: lightGreyColor),
                    borderRadius: BorderRadius.circular(20.0)
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your total points",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: GoogleFonts.poppins(
                          color: darkGreyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 3.5 * SizeConfig.textMultiplier),
                    ),
                    SizedBox(
                      height: 1*SizeConfig.heightMultiplier,
                    ),
                    Text(
                      "0",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: GoogleFonts.poppins(
                          color: darkGreyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 3.5 * SizeConfig.textMultiplier),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 3 * SizeConfig.heightMultiplier,
            ),
            MaterialButton(
              padding: EdgeInsets.symmetric(
                  vertical: 1.2 * SizeConfig.heightMultiplier,
                  horizontal: 30 * SizeConfig.widthMultiplier),
              color: themeColor,
              elevation: 4.0,
              onPressed: () {
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: Text(
                "Details",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 2.1 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5 * SizeConfig.heightMultiplier,
            )
          ]

          ),
        ),
      ),
    );
  }
}
