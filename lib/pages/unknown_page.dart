import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/footer.dart';
import 'package:site_molokovo/widgets/page_layout.dart';

class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      body: SizedBox(
        height: context.height - footerHeight,
        child: Center(child: CustomText(text: '404!', fontSize: 36, color: Color(activeColor),))
      ),
      footer: Footer(),
    );
  }
}