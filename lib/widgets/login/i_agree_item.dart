import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';

class IAgreeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 14,
          ),
          children: [
            TextSpan(
              text: 'I_agree_1'.tr,
              style: TextStyle(
                color: Color(darkColor),
              ),
            ),
            TextSpan(
              text: 'I_agree_2'.tr,
              style: TextStyle(
                color: Color(activeColor),
              ),
            )
          ]
        ),
      ),
      onTap: () {
        //launch('https://www.kgk-global.com/offer');
      },
    );
  }
}