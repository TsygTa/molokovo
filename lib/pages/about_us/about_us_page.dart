import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/footer.dart';
import 'package:site_molokovo/widgets/page_layout.dart';
import 'package:site_molokovo/widgets/page_title_widget.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageTitleWidget(title: 'about_us'.tr, icon: Icons.info_outline,),
          CustomText(text: 'about_us_text_1'.tr, color: Color(darkColor), fontSize: 20,),
          const SizedBox(height: 20,),
          CustomText(text: 'about_us_text_2'.tr, color: Color(darkColor), fontSize: 20,),
          const SizedBox(height: 20,),
          CustomText(text: 'about_us_text_3'.tr, color: Color(darkColor), fontSize: 20,),
          const SizedBox(height: 20,),
          CustomText(text: 'about_us_text_4'.tr, color: Color(darkColor), fontSize: 20,),
          const SizedBox(height: 40,),
          SizedBox(
            width: context.width,
            height: 600,
            child: Image.asset('assets/green_cows.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      footer: Footer(),
    );
  }
}