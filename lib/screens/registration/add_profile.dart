import 'dart:io';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/images.dart';
import 'package:topup/utils/size_config.dart';
import 'package:topup/utils/strings.dart';

class AddProfile extends StatefulWidget {
  @override
  _AddProfileState createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _text = TextEditingController();

  bool _validate = false;

  File _image;

  Future<void> getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Form(
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: 1.5 * SizeConfig.heightMultiplier,
              horizontal: 3.5 * SizeConfig.widthMultiplier),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Strings.add_profile_String,
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
                  child: _image == null
                      ? GestureDetector(
                          onTap: getImage,
                          child: Container(
                            height: 30 * SizeConfig.heightMultiplier,
                            width: 30 * SizeConfig.widthMultiplier,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: themeColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 8 * SizeConfig.imageSizeMultiplier,
                                ),
                                Text(
                                  'Tap to add photo',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          1.35 * SizeConfig.textMultiplier),
                                ),
                              ],
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: getImage,
                          child: ClipOval(
                            child: CircleAvatar(
                              backgroundColor: themeColor,
                              radius: 18 * SizeConfig.imageSizeMultiplier,
                              child: Image.file(
                                _image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )
                  ),
              SizedBox(
                height: 2 * SizeConfig.heightMultiplier,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 3 * SizeConfig.widthMultiplier),
                  child: Text(
                    'Name',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: darkGreyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 2 * SizeConfig.textMultiplier),
                  ),
                ),
              ),
              SizedBox(
                height: 1 * SizeConfig.heightMultiplier,
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
                      errorText: _validate ? 'Enter your name' : null,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: greyBorderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: greyBorderColor),
                      )),
                ),
              ),
                  SizedBox(
                    height: 5 * SizeConfig.heightMultiplier,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: (){
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) =>AddProfile()));
                      },
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
            ]),
          ),
        ),
      ),
    );
  }
}
