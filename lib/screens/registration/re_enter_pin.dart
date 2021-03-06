import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:topup/ModelClasses/UserModel.dart';
import 'package:topup/screens/registration/pin.dart';
import 'package:topup/screens/registration/security_questions.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/custom_widgets/app_bars.dart';
import 'package:topup/utils/custom_widgets/numeric_pad.dart';
import 'package:topup/utils/images.dart';
import 'package:topup/utils/size_config.dart';
import 'package:topup/utils/strings.dart';

class ReEnterPin extends StatefulWidget {
  
  @override
  _ReEnterPinState createState() => _ReEnterPinState();
}

class _ReEnterPinState extends State<ReEnterPin> {
  String pin= "";
  String error='';
  User user;

  @override
  Widget build(BuildContext context) {
    user=Provider.of<User>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar_withNoTitle(context),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pin.length>0? buildFilledCircles():buildCircles(),
                pin.length>1? buildFilledCircles():buildCircles(),
                pin.length>2? buildFilledCircles():buildCircles(),
                pin.length>3? buildFilledCircles():buildCircles(),
                pin.length>4? buildFilledCircles():buildCircles(),
                pin.length>5? buildFilledCircles():buildCircles(),

              ],
            ),

            SizedBox(
              height: 8 * SizeConfig.heightMultiplier,
            ),

            NumericPad(
              onNumberSelected: (value) {
                print(value);
                setState(() {
                  error='';
                  if(value != -1){
                    if(pin.length < 6){
                      pin = pin + value.toString();
                    }
                  }
                  else{
                    pin = pin.substring(0, pin.length - 1);
                  }
                  print(pin);
                  if(pin.length==6)
                    if(pin!=user.securityPin)
                      error='The pins Do not match';
                    else{
                      user.securityPin=pin;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SecurityQuestions()));
                    }
                });
              },
            ),
            SizedBox(
              height: 4 * SizeConfig.heightMultiplier,
            ),
            Text(error,style: TextStyle(color: Colors.red)),
            SizedBox(
              height: 4 * SizeConfig.heightMultiplier,
            ),
            // MaterialButton(
            //   padding: EdgeInsets.symmetric(
            //       vertical: 1.5 * SizeConfig.heightMultiplier,
            //       horizontal: 30 * SizeConfig.widthMultiplier),
            //   color: themeColor,
            //   elevation: 4.0,
            //   onPressed: () {
            //     setState(() {
            //       if(pin.length!=6)
            //         setState(() {
            //           error='Please enter complete digits';
            //         });
            //       else if(pin!=user.securityPin)
            //         error='The pins Do not match';
            //       else{
            //         user.securityPin=pin;
            //         // Navigator.push(context,
            //         //     MaterialPageRoute(builder: (context) => ReEnterPin(user:user)));
            //       }
            //     });
            //   },
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(12.0))),
            //   child: Text(
            //     "Continue",
            //     style: GoogleFonts.poppins(
            //         color: Colors.white,
            //         fontSize: 2.1 * SizeConfig.textMultiplier,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),

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

Widget buildFilledCircles() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 1 * SizeConfig.widthMultiplier),
    child: SizedBox(
      width: 4.2 * SizeConfig.widthMultiplier,
      height: 2.2 * SizeConfig.heightMultiplier,
      child: Container(
        decoration: BoxDecoration(
          color: darkGreyColor,
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
