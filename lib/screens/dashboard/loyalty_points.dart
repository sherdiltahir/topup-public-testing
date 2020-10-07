import 'package:flutter/material.dart';
import 'package:topup/utils/custom_widgets/app_bars.dart';

class Loyalty_Points extends StatefulWidget {
  @override
  _Loyalty_PointsState createState() => _Loyalty_PointsState();
}

class _Loyalty_PointsState extends State<Loyalty_Points> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: dashboardAppBar_home(context, "Loyalty Points"),
      ),
    );
  }
}

