import 'package:flutter/material.dart';
import 'package:topup/utils/custom_widgets/app_bars.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: dashboardAppBar_home(context, "Settings"),
      ),
    );
  }
}
