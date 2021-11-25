import 'package:flutter/material.dart';
import 'package:site_molokovo/constants/style.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    required this.imagePath,
    required this.width,
    required this.height
  });

  final String imagePath;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(imagePath).image
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color(lightColor),
      ),
    );
  }
}