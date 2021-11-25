import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/constrained_widget.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/footer.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 40,),
        ConstrainedWidget(Image.asset('assets/cows_3.png', fit: BoxFit.fitWidth)),
        Container(
          height: Get.height - 200,
          color: const Color(lightColor),
          child: Center(child: CustomText(text: 'about_us'.tr, fontSize: 40,),),
        ),
        Footer()
      ],
    );
  }
}