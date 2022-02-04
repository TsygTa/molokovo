import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/page_title_widget.dart';

class DeliveryInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageTitleWidget(title: 'delivery'.tr, icon: Icons.airport_shuttle_outlined),
        CustomText(text: 'delivery_text_1'.tr, color: Color(darkColor), fontSize: 36,),
        const SizedBox(height: 20,),
        CustomText(text: 'delivery_text_2'.tr, color: Color(darkColor), fontSize: 20,),
        const SizedBox(height: 20,),
        CustomText(text: 'delivery_text_3'.tr, color: Color(darkColor), fontSize: 20,),
        const SizedBox(height: 20,),
        CustomText(text: 'delivery_text_4'.tr, color: Color(darkColor), fontSize: 20,),
        const SizedBox(height: 20,),
        PageTitleWidget(title: 'payment'.tr, icon: Icons.attach_money),
        CustomText(text: 'payment_text_1'.tr, color: Color(darkColor), fontSize: 20,),
      ],
    );
  }
}