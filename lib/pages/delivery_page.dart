import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/footer.dart';

class DeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: Get.height - 200,
          color: const Color(lightColor),
          child: Center(child: CustomText(text: 'delivery'.tr, fontSize: 40,),),
        ),
        Footer()
      ],
    );
  }
}