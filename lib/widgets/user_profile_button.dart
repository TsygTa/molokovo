import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/app_route.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/controllers/app_pages_controllers.dart';
import 'package:site_molokovo/controllers/auth_controller.dart';
import 'package:site_molokovo/models/user.dart';
import 'package:site_molokovo/widgets/custom_text.dart';

class UserProfileButton extends StatelessWidget {

  void _onPressed(BuildContext context) {
    AppPagesController pagesController = Get.find<AppPagesController>();
    pagesController.setPage(AppRoute.userProfile);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return TextButton(
            onPressed: () => _onPressed(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.face, color: Color(darkColor), size: 25,),
                CustomText(text: controller.user?.name, fontSize: 12,),
              ],
            ),
        );
      }
    );
  }
}