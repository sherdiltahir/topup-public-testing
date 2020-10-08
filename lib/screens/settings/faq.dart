import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/size_config.dart';
import 'package:topup/utils/strings.dart';
import 'package:expandable/expandable.dart';


class FAQ {
  final String ques;
  final String ans;

  FAQ(this.ques, this.ans);
}

class FAQ_Tab extends StatefulWidget {
  @override
  _FAQ_TabState createState() => _FAQ_TabState();
}

class _FAQ_TabState extends State<FAQ_Tab> {
  static FAQs faQs_1 = new FAQs(Strings.ques_1, Strings.ans_1);
  static FAQs faQs_2 = new FAQs(Strings.ques_2, Strings.ans_2);
  static FAQs faQs_3 = new FAQs(Strings.ques_3, Strings.ans_3);

  List<FAQs> FAQs_List = [faQs_1, faQs_2, faQs_3];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 1.5 * SizeConfig.heightMultiplier,
            horizontal: 3.5 * SizeConfig.widthMultiplier),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: FAQs_List.length,
            itemBuilder: (context, index) {
              final item = FAQs_List[index];
              return FAQs(item._ques, item._ans);
            }),
      ),
    );
  }
}

class FAQs extends StatelessWidget {
  var _ques, _ans;

  FAQs(this._ques, this._ans);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 0.8 * SizeConfig.heightMultiplier,
          horizontal: 1.0 * SizeConfig.widthMultiplier),
      child: Container(
        decoration: BoxDecoration(
          color:themeColor,
          borderRadius: BorderRadius.all(Radius.circular(16)),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 2 * SizeConfig.heightMultiplier,
                  horizontal: 1.8 * SizeConfig.widthMultiplier),
              child: Text(
                _ques,
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 1.7 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(16),bottomRight:  Radius.circular(16)),

                ),
              padding: EdgeInsets.symmetric(
                  vertical: 2 * SizeConfig.heightMultiplier,
                  horizontal: 1.8 * SizeConfig.widthMultiplier),
              child: Text(
                _ans,
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                    color: darkGreyColor,
                    fontSize: 1.6 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
