import 'package:flutter/material.dart';
import 'package:topup/utils/size_config.dart';

import '../color.dart';

Widget buildCircles() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 1 * SizeConfig.widthMultiplier),
    child: SizedBox(
      width: 3 * SizeConfig.widthMultiplier,
      height: 1.5 * SizeConfig.heightMultiplier,
      child: Container(
        decoration: BoxDecoration(
          color: lightGreyColor,
          borderRadius: BorderRadius.all(
            Radius.circular(100),
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
      width: 3.6 * SizeConfig.widthMultiplier,
      height: 1.8 * SizeConfig.heightMultiplier,
      child: Container(
        decoration: BoxDecoration(
          color: darkGreyColor,
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          boxShadow: <BoxShadow>[

          ],
        ),
      ),
    ),
  );
}