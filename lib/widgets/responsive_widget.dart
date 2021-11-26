import 'package:flutter/material.dart';
import 'package:get/get.dart';

const int largeScreenSize = 1366; //1248
const int mediumScreenSize = 768;
const int smallScreenSize = 360;
const int customScreenSize = 1300;

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({Key? key,
    required this.largeScreen,
    required this.mediumScreen,
    required this.smallScreen
  }): super(key: key);

  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  static bool isSmallScreen(BuildContext context) => context.width < mediumScreenSize;
  static bool isMediumScreen(BuildContext context) => Get.size.width >= mediumScreenSize && Get.size.width < largeScreenSize;
  static bool isLargeScreen(BuildContext context) => Get.size.width >= largeScreenSize;
  static bool isCustomScreen(BuildContext context) => Get.size.width >= mediumScreenSize && Get.size.width <= customScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double _width = constraints.maxWidth;
      if(_width >= largeScreenSize) {
        return largeScreen;
      } else if(_width < largeScreenSize && _width >= mediumScreenSize) {
        return mediumScreen ?? largeScreen;
      } else {
        return smallScreen ?? largeScreen;
      }
    });
  }

}