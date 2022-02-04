import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/controllers/auth_controller.dart';
import 'package:site_molokovo/pages/user_profile/user_profile_widget.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/footer.dart';
import 'package:site_molokovo/widgets/page_layout.dart';
import 'package:site_molokovo/widgets/page_title_widget.dart';

class UserProfilePage extends GetView<AuthController> {

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTitleWidget(title: 'user_profile'.tr, icon: Icons.portrait_outlined,),
            UserProfileWidget(),
            const SizedBox(height: 20,),
            TextButton(
              onPressed: controller.logout,
              child: CustomText(text: 'sign_out'.tr, fontSize: 28,))
          ],
        ),
        footer: Footer()
    );
  }
}