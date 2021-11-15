import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/footer.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: Get.height - 200,
          color: Color(lightColor),
          child: Center(child: CustomText(text: 'products'.tr, fontSize: 40,),),
        ),
        Footer()
      ],
    );
  }
}