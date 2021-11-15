import 'package:flutter/material.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';

class CustomText extends StatelessWidget {

  CustomText({
    this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.decoration
  });

  final String? text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    double size = fontSize ?? 16;
    if(ResponsiveWidget.isSmallScreen(context)) {
      size /= 1.2;
    } else if(ResponsiveWidget.isMediumScreen(context)) {
      size /= 1.1;
    }
    return Text(
      text ?? '',
      style: TextStyle(
        decoration: decoration,
        color: color ?? Color(darkColor),
        fontSize: size,
        fontWeight: fontWeight ?? FontWeight.normal),);
  }
}