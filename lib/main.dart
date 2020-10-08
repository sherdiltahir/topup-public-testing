
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:topup/screens/welcome/splash.dart';
import 'package:topup/utils/color.dart';
import 'package:topup/utils/size_config.dart';

import 'ModelClasses/UserModel.dart';


void main() {
  runApp(
    // MyApp()
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context)=>MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return ChangeNotifierProvider(create: (BuildContext context) =>User(),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'TopUp',
                //theme: AppTheme.lightTheme,
                theme: ThemeData(
                    canvasColor: Colors.transparent,
                    primaryColor: appThemeColor
                ),
                home: Splash(),
              ),
            );
          },
        );
      },
    );
  }
}


