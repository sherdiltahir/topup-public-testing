import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:topup/ModelClasses/CouponsModel.dart';
import 'package:topup/screens/dashboard/barcode.dart';
import 'package:topup/screens/dashboard/coupon.dart';
import 'package:topup/screens/dashboard/home.dart';
import 'package:topup/screens/dashboard/loyalty_points.dart';
import 'package:topup/screens/dashboard/settings.dart';
import 'package:topup/utils/color.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController _controller = new PageController();
  int _currentIndex = 0;

  void _pageChange(int index) {
    setState(() {
      if (_currentIndex != index) {
        _currentIndex = index;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SnakeShape customSnakeShape = SnakeShape(
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        centered: true);
    ShapeBorder customBottomBarShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: themeColor,
          statusBarIconBrightness: Brightness.light),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: AnimatedContainer(
            duration: Duration(seconds: 1),
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged:(index) => setState(() => {
                _currentIndex = index,
                _controller.jumpToPage(index),
              }) ,
              children: [
                Home(),
                MyCoupon(),
                Scan_Barcode(),
                Loyalty_Points(),
                Settings(),
              ],
            ),
          ),
          bottomNavigationBar: SnakeNavigationBar(
            onPositionChanged: (index) => setState(() => {
                  _currentIndex = index,
                  _controller.jumpToPage(index),
                }),
            backgroundColor: themeColor,
            currentIndex: _currentIndex,
            snakeShape: SnakeShape.circle,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            shape: customBottomBarShape,
            snakeColor: Colors.white,
            selectedItemColor: darkGreyColor,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.language), title: Text("")),
              BottomNavigationBarItem(icon: Icon(Icons.flag), title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.camera), title: Text("")),
              BottomNavigationBarItem(icon: Icon(Icons.phone), title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), title: Text("")),
            ],

          ),
        ),
      ),
    );
  }
}
