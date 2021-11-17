import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';


class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(context.width * mainPaddingRatio, 10, context.width * mainPaddingRatio, 5),
        height: 200,
        color:Color(darkGreyColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/phone-call.png'),
                SizedBox(width: 10,),
                CustomText(text: companyPhoneNumber, color: const Color(lightColor), fontSize: 16,)
              ],
            ),
            Row(
              children: [
                Image.asset('assets/envelope.png'),
                SizedBox(width: 10,),
                CustomText(text: companyEmail, color: const Color(lightColor), fontSize: 16,)
              ],
            ),
            const SizedBox(height: 30,),
            const Divider(height: 10, color: Color(lightColor), thickness: 1,),
            CustomText(text: 'disclaimer'.tr, color: const Color(lightColor), fontSize: 14,)
          ],
        )
    );
  }
}