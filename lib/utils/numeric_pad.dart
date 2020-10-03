import 'package:flutter/material.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/size_config.dart';

class NumericPad extends StatelessWidget {

final Function(int) onNumberSelected;

NumericPad({@required this.onNumberSelected});

@override
Widget build(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[

        Container(
          height: 9*SizeConfig.heightMultiplier,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildNumber(1),
              buildNumber(2),
              buildNumber(3),
            ],
          ),
        ),

        Container(
          height: 9*SizeConfig.heightMultiplier,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildNumber(4),
              buildNumber(5),
              buildNumber(6),
            ],
          ),
        ),

        Container(
          height: 9*SizeConfig.heightMultiplier,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildNumber(7),
              buildNumber(8),
              buildNumber(9),
            ],
          ),
        ),

        Container(
          height: 9*SizeConfig.heightMultiplier,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildEmptySpace(),
              buildNumber(0),
              buildBackspace(),
            ],
          ),
        ),

      ],
    ),
  );
}

Widget buildNumber(int number) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        onNumberSelected(number);
      },
      child: Padding(
        padding: EdgeInsets.all(1*SizeConfig.widthMultiplier),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: themeColor,

          ),
          child: Center(
            child: Text(
              number.toString(),
              style: TextStyle(
                fontSize: 2.5*SizeConfig.textMultiplier,
                fontWeight: FontWeight.bold,
                color: darkGreyColor,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildBackspace() {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        onNumberSelected(-1);
      },
      child: Padding(
        padding: EdgeInsets.all(1*SizeConfig.widthMultiplier),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
           shape:BoxShape.circle
          ),
          child: Center(
            child: Icon(
              Icons.backspace,
              size: 10*SizeConfig.imageSizeMultiplier,
              color: darkGreyColor,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildEmptySpace() {
  return Expanded(
    child: Container(),
  );
}

}