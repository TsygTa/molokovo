import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.title = '', this.onPressed,
    this.backgroundColor = const Color(activeColor), this.titleColor = const Color(lightColor)});
  final String title;
  final void Function()? onPressed;
  final Color titleColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          primary: backgroundColor,
        ),
        onPressed: onPressed,
        child: CustomText(text: 'send_code'.tr, fontSize: 16, color: titleColor,),
      ),
    );
  }
}