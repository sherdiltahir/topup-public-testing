import 'package:flutter/material.dart';
import 'package:topup/utils/custom_widgets/app_bars.dart';

class MyCoupon extends StatefulWidget {
  @override
  _MyCouponState createState() => _MyCouponState();
}

class _MyCouponState extends State<MyCoupon> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: dashboardAppBar_home(context, "Coupon"),
      ),
    );
  }
}
