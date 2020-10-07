import 'package:flutter/material.dart';
import 'package:topup/utils/custom_widgets/app_bars.dart';

class Scan_Barcode extends StatefulWidget {
  @override
  _Scan_BarcodeState createState() => _Scan_BarcodeState();
}

class _Scan_BarcodeState extends State<Scan_Barcode> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: dashboardAppBar_home(context, "Barcode"),
      ),
    );
  }
}
