import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/page_title_widget.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';
import 'package:site_molokovo/widgets/wrap_widget.dart';

class ContactsInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double width = ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isMediumScreen(context) ? context.width * 0.8 : context.width * 0.2;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageTitleWidget(title: 'our_contacts'.tr, icon: Icons.contact_mail_outlined),
        WrapWidget(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'phone'.tr, color: Color(darkColor), fontSize: 18, fontWeight: FontWeight.bold,),
                    const SizedBox(height: 10,),
                    CustomText(text: companyPhoneNumber, color: Color(darkColor), fontSize: 16,),
                    const SizedBox(height: 10,),
                    CustomText(text: 'working_hours'.tr, color: Color(darkColor), fontSize: 14,),
                  ],
                )
            ),

            Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CustomText(text: 'E-mail',  color: Color(darkColor), fontSize: 18, fontWeight: FontWeight.bold,),
                    SizedBox(height: 10,),
                    CustomText(text: companyEmail, color: Color(darkColor), fontSize: 16,),
                  ],
                )
            ),

            Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'address'.tr, color: const Color(darkColor), fontSize: 18, fontWeight: FontWeight.bold,),
                    const SizedBox(height: 10,),
                    CustomText(text: companyAddress, color: const Color(darkColor), fontSize: 14,),
                  ],
                )
            ),
          ],
        )
      ],
    );
  }
}