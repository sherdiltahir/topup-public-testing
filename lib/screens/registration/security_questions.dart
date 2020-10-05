import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/images.dart';
import 'package:topup/utils/size_config.dart';
import 'package:topup/utils/strings.dart';

class SecurityQuestions extends StatefulWidget {
  @override
  _SecurityQuestionsState createState() => _SecurityQuestionsState();
}

class _SecurityQuestionsState extends State<SecurityQuestions> {

  int _questionSelected;

  List<DropdownMenuItem<int>> questionList = [];

  loadQuestions() {
    questionList = [];
    questionList.add(new DropdownMenuItem(
      value: 0,
      child: new Text(
        'What was the name of your first pet?',
        textAlign: TextAlign.left,
        style: GoogleFonts.poppins(
            color: darkGreyColor,
            fontWeight: FontWeight.w300,
            fontSize: 1.6 * SizeConfig.textMultiplier),
      ),),);
    questionList.add(new DropdownMenuItem(
      value: 1,
      child: new Text(
        'What was the name of your first toy?',
        textAlign: TextAlign.left,
        style: GoogleFonts.poppins(
            color: darkGreyColor,
            fontWeight: FontWeight.w300,
            fontSize: 1.6 * SizeConfig.textMultiplier),
      ),),);
    questionList.add(new DropdownMenuItem(
      value: 2,
      child: new Text(
        'What was youngest brother name?',
        textAlign: TextAlign.left,
        style: GoogleFonts.poppins(
            color: darkGreyColor,
            fontWeight: FontWeight.w300,
            fontSize: 1.6 * SizeConfig.textMultiplier),
      ),),);
  }

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.arrow_back_ios,
              color: darkGreyColor,
              size: 4 * SizeConfig.imageSizeMultiplier,
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              vertical: 1.5 * SizeConfig.heightMultiplier,
              horizontal: 3.5 * SizeConfig.widthMultiplier),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    shield_Image,
                    height: 8.5 * SizeConfig.heightMultiplier,
                    width: 8.5 * SizeConfig.widthMultiplier,
                    color: themeColor,
                  ),
                ),
                SizedBox(
                  height: 1.5 * SizeConfig.heightMultiplier,
                ),
                Center(
                  child: Text(
                    Strings.security_questions_String,
                    style: GoogleFonts.poppins(
                        color: darkGreyColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 2.2 * SizeConfig.textMultiplier),
                  ),
                ),
                SizedBox(
                  height: 1 * SizeConfig.heightMultiplier,
                ),
                Center(
                  child: Text(
                    Strings.security_questions_details_String,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: darkGreyColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 1.6 * SizeConfig.textMultiplier),
                  ),
                ),
                SizedBox(
                  height: 5.5 * SizeConfig.heightMultiplier,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 3*SizeConfig.widthMultiplier),
                    child: Text(
                      'Question 1',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: darkGreyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 1.6 * SizeConfig.textMultiplier),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.5 * SizeConfig.heightMultiplier,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 3*SizeConfig.widthMultiplier,right: 3*SizeConfig.widthMultiplier),
                    child: DropdownButtonFormField(
                      dropdownColor: Colors.white,
                      items: questionList,
                      value: _questionSelected,
                      onChanged: (value){
                        setState(() {
                          _questionSelected = value;
                        });
                      },
                      isExpanded: true,
                    )
                  ),
                ),
                SizedBox(
                  height: 2 * SizeConfig.heightMultiplier,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 3*SizeConfig.widthMultiplier,right: 3*SizeConfig.widthMultiplier),
                    child: Text(
                      'Question 2',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: darkGreyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 1.6 * SizeConfig.textMultiplier),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.5 * SizeConfig.heightMultiplier,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      margin: EdgeInsets.only(left: 3*SizeConfig.widthMultiplier,right: 3*SizeConfig.widthMultiplier),
                      child: DropdownButtonFormField(
                        dropdownColor: Colors.white,
                        items: questionList,
                        value: _questionSelected,
                        onChanged: (value){
                          setState(() {
                            _questionSelected = value;
                          });
                        },
                        isExpanded: true,
                      )
                  ),
                ),
                SizedBox(
                  height: 3 * SizeConfig.heightMultiplier,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: themeColor,
                      ),
                      margin: EdgeInsets.only(right: 3*SizeConfig.widthMultiplier),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 10*SizeConfig.imageSizeMultiplier,
                      )
                  ),
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
