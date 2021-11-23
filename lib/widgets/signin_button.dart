import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/controllers/auth_controller.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/login/login_dialog.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';

class SignInButton extends StatelessWidget {

  void _onPressed(BuildContext context) {
    Get.find<AuthController>().authInit();
    showLoginDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    if(ResponsiveWidget.isLargeScreen(context)) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            primary: Color(greyColor),
            onPrimary: Color(darkColor),
          ),
          onPressed: () {
            _onPressed(context);
          },
          child: CustomText(text: 'sign_in'.tr),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: IconButton(
          icon: Icon(Icons.input, color: Color(activeColor), size: 30,),
          onPressed: () {
            _onPressed(context);
          },
        ),
      );
    }
  }
}