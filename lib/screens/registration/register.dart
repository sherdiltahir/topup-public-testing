// import 'dart:ffi';
//
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:topup/ModelClasses/UserModel.dart';
// import 'package:topup/screens/login/login.dart';
// import 'package:topup/screens/registration/phone_verify.dart';
// import 'package:topup/screens/registration/pin.dart';
// import 'package:topup/utils/color.dart';
// import 'package:topup/utils/custom_widgets/app_bars.dart';
// import 'package:topup/utils/images.dart';
// import 'package:topup/utils/size_config.dart';
// import 'package:topup/utils/strings.dart';
//
// class Register extends StatefulWidget {
//   @override
//   _RegisterState createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   bool _autoValidate = false;
//
//   final _text = TextEditingController();
//   User currentUser=new User();
//   bool _validate=false;
//   String _phone_number = null;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: appBar_withHelp(context,"Register"),
//         body: Form(
//           key: _formKey,
//           autovalidate: _autoValidate,
//           child: Container(
//             margin: EdgeInsets.symmetric(
//                 vertical: 1.5 * SizeConfig.heightMultiplier,
//                 horizontal: 3.5 * SizeConfig.widthMultiplier),
//             child: SingleChildScrollView(
//               child:Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: SvgPicture.asset(
//                       mobile_Image,
//                       height: 8.5 * SizeConfig.heightMultiplier,
//                       width: 8.5 * SizeConfig.widthMultiplier,
//                       color: themeColor,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 1.5 * SizeConfig.heightMultiplier,
//                   ),
//                   Center(
//                     child: Text(
//                       Strings.mobile_number_String,
//                       style: GoogleFonts.poppins(
//                           color: darkGreyColor,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 2.2 * SizeConfig.textMultiplier),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 1 * SizeConfig.heightMultiplier,
//                   ),
//                   Center(
//                     child: Text(
//                       Strings.mobile_verfication_String,
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.poppins(
//                           color: darkGreyColor,
//                           fontWeight: FontWeight.w300,
//                           fontSize: 1.6 * SizeConfig.textMultiplier),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 3 * SizeConfig.heightMultiplier,
//                   ),
//                   Center(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 3.5 * SizeConfig.widthMultiplier),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Image.asset(flag_Image,width: 8.5*SizeConfig.widthMultiplier,height: 8.5*SizeConfig.heightMultiplier,),
//                           SizedBox(
//                             width: 1 * SizeConfig.widthMultiplier,
//                           ),
//                            Text(
//                             "+7",
//                             style: GoogleFonts.poppins(
//                                 color: darkGreyColor,
//                                 fontWeight: FontWeight.w300,
//                                 fontSize: 2.0 * SizeConfig.textMultiplier),
//                           ),
//                           Expanded(
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 3 * SizeConfig.widthMultiplier),
//                               child: TextFormField(
//                                 controller: _text,
//                                 keyboardType: TextInputType.number,
//                                 onChanged: _updatePhone,
//                                 style: GoogleFonts.poppins(
//                                     color: darkGreyColor,
//                                     fontSize: 2.0 * SizeConfig.textMultiplier),
//                                 validator: (String phone_number){
//                                  if(phone_number==null)
//                                     return 'Enter your phone number';
//                                  else if(phone_number.length!=10)
//                                    return 'Enter a valid phone number';
//                                   else
//                                     return null;
//                                 },
//                                 onSaved: (String val){
//                                   _phone_number=val;
//                                 },
//                                 decoration: InputDecoration(
//                                     errorText: _validate ? 'Enter a valid phone number' : null,
//                                     hintText: Strings.mobile_hint_String),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5 * SizeConfig.heightMultiplier,
//                   ),
//                   MaterialButton(
//                     padding: EdgeInsets.symmetric(
//                         vertical: 1.2 * SizeConfig.heightMultiplier,
//                         horizontal: 30 * SizeConfig.widthMultiplier),
//                     color: themeColor,
//                     elevation: 4.0,
//                     onPressed: () {
//                       if(_formKey.currentState.validate()){
//                         _formKey.currentState.save();
//                         Navigator.push(context, MaterialPageRoute(
//                             builder:(context)=>VerifyPhone()
//                         ));
//
//                       }else{
//                         setState(() {
//                           _autoValidate = true;
//                         });
//                       }
//                       //Navigator.pop(context);
//                     },
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(12.0))),
//                     child: Text(
//                       "Register",
//                       style: GoogleFonts.poppins(
//                           color: Colors.white,
//                           fontSize: 2.1 * SizeConfig.textMultiplier,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 2.5 * SizeConfig.heightMultiplier,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         Strings.already_account_String,
//                         style: GoogleFonts.poppins(
//                             fontSize: 1.6 * SizeConfig.textMultiplier,
//                             fontWeight: FontWeight.w400,
//                             color: darkGreyColor),
//                       ),
//                       SizedBox(
//                         width: 1 * SizeConfig.widthMultiplier,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(
//                               builder:(context)=>Login()
//                           ));
//                         },
//                         child: Text(
//                           "Login",
//                           style: GoogleFonts.poppins(
//                               fontSize: 2.2 * SizeConfig.textMultiplier,
//                               fontWeight: FontWeight.bold,
//                               color: darkGreyColor),
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 25 * SizeConfig.heightMultiplier,
//                   ),
//                   Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Row(
//                       children: [
//                         Image.asset(flag_Image,width: 8.5*SizeConfig.widthMultiplier,height: 8.5*SizeConfig.heightMultiplier,),
//                         SizedBox(
//                           width: 2 * SizeConfig.widthMultiplier,
//                         ),
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: (){
//
//                             },
//                             child: RichText(
//                               text:TextSpan(
//                                 text:'By clicking the ',
//                                 style: GoogleFonts.poppins(
//                                   color: darkGreyColor,
//                                   fontSize: 1.35 * SizeConfig.textMultiplier,
//                                   fontWeight: FontWeight.w400,
//                               ),
//                                 children: <TextSpan>[
//                                   TextSpan(
//                                     text: 'Register',
//                                       style: GoogleFonts.poppins(
//                                         color: darkBlueColor,
//                                         fontSize: 1.37 * SizeConfig.textMultiplier,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                   ),
//                                   TextSpan(
//                                       text:' I agree to TopUp ',
//                                       style: GoogleFonts.poppins(
//                                         color: darkGreyColor,
//                                         fontSize: 1.35 * SizeConfig.textMultiplier,
//                                         fontWeight: FontWeight.w400,
//                                       )
//                                   ),
//                                   TextSpan(text: 'Terms & Conditions',
//                                     style: GoogleFonts.poppins(
//                                       color: darkBlueColor,
//                                       fontSize: 1.37 * SizeConfig.textMultiplier,
//                                       fontWeight: FontWeight.w500,
//                                     ),),
//                                   TextSpan(
//                                       text:' and ',
//                                       style: GoogleFonts.poppins(
//                                         color: darkGreyColor,
//                                         fontSize: 1.35 * SizeConfig.textMultiplier,
//                                         fontWeight: FontWeight.w400,
//                                       )
//                                   ),
//                                   TextSpan(text: 'Privacy Policy',
//                                     style: GoogleFonts.poppins(
//                                       color: darkBlueColor,
//                                       fontSize: 1.37 * SizeConfig.textMultiplier,
//                                       fontWeight: FontWeight.w500,
//                                     ),),
//                                 ]
//
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   String validateMobile(String value) {
//     if (value.length != 10)
//       return 'Mobile Number must be of 10 digit';
//     else
//       return null;
//   }
//
//   void _validateInputs() {
//     if (_formKey.currentState.validate()) {
// //    If all data are correct then save data to out variables
//       _formKey.currentState.save();
//     } else {
// //    If all data are not valid then start auto validation.
//       setState(() {
//         _autoValidate = true;
//       });
//     }
//   }
//
//   void _updatePhone(String value) {
//     if (value.length>0){
//       setState(() {
//         _validate=false;
//       });
//     }
//     if (value.length==10)
//       currentUser.phoneNumber='+7'+value;
//     else
//       currentUser.phoneNumber='';
//   }
// }
