import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topup/screens/dashboard/dashboard.dart';
import 'package:topup/screens/profile/my_profile.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/size_config.dart';
import 'package:topup/utils/strings.dart';

class HelpCentre extends StatefulWidget {
  @override
  _HelpCentreState createState() => _HelpCentreState();
}

class _HelpCentreState extends State<HelpCentre> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _complaint;

  List<DropdownMenuItem<int>> _complaintList = [];
  List<String> _stringComplaintList = [
    'QR Scan Difficulty',
    'Payment Issues',
    'Ranking Queries',
    'Payment Refund',
    'Others'
  ];

  loadComplaint() {
    _complaintList = [];
    int index = 0;
    for (var text in _stringComplaintList) {
      _complaintList.add(
        new DropdownMenuItem(
          value: index,
          child: new Text(
            text,
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
                color: darkGreyColor,
                fontWeight: FontWeight.w300,
                fontSize: 1.6 * SizeConfig.textMultiplier),
          ),
        ),
      );
      index++;
    }
  }

  @override
  void initState() {
    super.initState();
    loadComplaint();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(
            vertical: 2.5 * SizeConfig.heightMultiplier,
            horizontal: 3.5 * SizeConfig.widthMultiplier),
        //padding: EdgeInsets.symmetric(vertical: 1.5*SizeConfig.heightMultiplier,horizontal: 3.5*SizeConfig.widthMultiplier),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 3 * SizeConfig.widthMultiplier),
                  child: Text(
                    Strings.complaint_type,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: darkGreyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 1.7 * SizeConfig.textMultiplier),
                  ),
                ),
              ),
              SizedBox(
                height: 1 * SizeConfig.heightMultiplier,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 3 * SizeConfig.widthMultiplier),
                    child: DropdownButtonFormField(
                      dropdownColor: Colors.white,
                      items: _complaintList,
                      value: _complaint,
                      onChanged: (value) {
                        setState(() {
                          _complaint = value;
                        });
                      },
                      isExpanded: true,
                    )),
              ),
              SizedBox(
                height: 2 * SizeConfig.heightMultiplier,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 3 * SizeConfig.widthMultiplier),
                  child: Text(
                    Strings.complaint_desc,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: darkGreyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 1.7 * SizeConfig.textMultiplier),
                  ),
                ),
              ),
              SizedBox(
                height: 1 * SizeConfig.heightMultiplier,
              ),
              Container(
                height: 25 * SizeConfig.heightMultiplier,
                margin: EdgeInsets.symmetric(
                    horizontal: 3 * SizeConfig.widthMultiplier),
                child: TextFormField(
                  minLines: 10,
                  maxLines: 20,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          EdgeInsets.all(0.5 * SizeConfig.heightMultiplier),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(8.0)),
                        borderSide: BorderSide(
                            color:lightGreyColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(8.0)),
                        borderSide: BorderSide(
                            color:lightGreyColor),
                      )
                  ),
                  autofocus: false,
                  autocorrect: true,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                      color: darkGreyColor,
                      fontSize: 1.8 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.normal),
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
                  "Send",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 2.1 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
