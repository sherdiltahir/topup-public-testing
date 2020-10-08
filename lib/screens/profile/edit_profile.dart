import 'dart:io';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/custom_widgets/app_bars.dart';
import 'package:topup/utils/size_config.dart';
import 'package:topup/utils/strings.dart';

class Edit_Profile extends StatefulWidget {
  @override
  _Edit_ProfileState createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _text = TextEditingController();

  File _image;

  bool _loading = false;

  Future<void> getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar_withNoTitle(context),
          body: Builder(builder: (BuildContext currentContext) {
            return Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: 1.5 * SizeConfig.heightMultiplier,
                    horizontal: 3.5 * SizeConfig.widthMultiplier),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            Strings.edit_profile_String,
                            style: GoogleFonts.poppins(
                                color: darkGreyColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 2.2 * SizeConfig.textMultiplier),
                          ),
                        ),
                        SizedBox(
                          height: 2 * SizeConfig.heightMultiplier,
                        ),
                        Center(

                          child: _image==null?GestureDetector(
                            onTap: getImage,
                            child: CircularProfileAvatar(
                              "https://i.pravatar.cc/300",
                              borderWidth: 6.0,
                              radius: 70.0,
                              backgroundColor: themeColor,
                              borderColor: themeColor,
                              cacheImage: true,
                              foregroundColor: themeColor.withOpacity(0.5),
                              elevation: 4.0,
                            ),
                          ):GestureDetector(
                            onTap: getImage,
                            child: ClipOval(
                                child: CircleAvatar(
                                  backgroundColor: themeColor,
                                  radius:
                                  18 * SizeConfig.imageSizeMultiplier,
                                  child: Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                          ),
                        ),
                        SizedBox(
                          height: 3.5 * SizeConfig.heightMultiplier,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.symmetric(
                              horizontal: 3 * SizeConfig.widthMultiplier),
                          child: TextFormField(
                            controller: _text,
                            style: GoogleFonts.poppins(
                                color: darkGreyColor,
                                fontSize: 2.0 * SizeConfig.textMultiplier),
                            validator: (String name) {
                              if (name == null)
                                return 'Enter your name';
                              else
                                return null;
                            },
                            decoration: InputDecoration(
                                //errorText: _validate ? 'Enter your name' : null,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: lightGreyColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: lightGreyColor),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.heightMultiplier,
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
                            "Update",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 2.1 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                      ]),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
