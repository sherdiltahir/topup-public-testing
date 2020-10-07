import 'dart:io';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:topup/ModelClasses/UserModel.dart';
import 'package:topup/Services/FirebaseDatabaseService.dart';
import 'package:topup/Services/FirebaseStorageService.dart';
import 'package:topup/screens/registration/add_card.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/custom_widgets/app_bars.dart';
import 'package:topup/utils/images.dart';
import 'package:topup/utils/size_config.dart';
import 'package:topup/utils/strings.dart';

class AddProfile extends StatefulWidget {
  final User user;

  const AddProfile({Key key, this.user}) : super(key: key);

  @override
  _AddProfileState createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar_withNoTitle(context),
        body: Form(
          key: _formKey,
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
                  height: 1.5 * SizeConfig.heightMultiplier,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 3 * SizeConfig.widthMultiplier),
                    child: Text(
                      'Fullname',
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
                        fontSize: 1.8 * SizeConfig.textMultiplier),
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
                          borderSide: BorderSide(color: lightGreyColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: lightGreyColor),
                        )),
                  ),
                ),
                    SizedBox(
                      height: 5 * SizeConfig.heightMultiplier,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () async {
                          if(_text.text.length<2){
                            setState(() {
                              _validate=true;
                            });
                          }
                          else{
                            widget.user.name=_text.text;
                            if(_image!=null)
                              widget.user.picture=_image;
                            widget.user.pictureUri=await StorageService().uploadUserProfile(_image, "User Profile", widget.user.id);
                            await DatabaseService().setUserData(widget.user);
                            setState(() {
                            _validate=false;
                          });
                          }



                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) =>AddProfile()));
                        },
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>Add_Card()));
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
                      ),
                    )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
