import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/controllers/auth_controller.dart';
import 'package:site_molokovo/pages/user_profile/user_profile_item.dart';
import 'package:site_molokovo/widgets/constrained_widget.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/footer.dart';

class UserProfilePage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: context.height,),
        ConstrainedWidget(
          GetBuilder<AuthController>(
            builder: (_) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'user_profile'.tr, fontSize: 18, fontWeight: FontWeight.bold,),
                  UserProfileItem(
                    isEditable: true,
                    label: 'user_name'.tr,
                    onSubmit: (value) {
                      controller.changeUserName(value);
                    },
                  ),
                  // UserProfileItem(
                  //   label: 'phone'.tr,
                  // ),
                  // UserProfileItem(
                  //   isEditable: true,
                  //   label: 'email'.tr,
                  //   onSubmit: (value) {
                  //     controller.changeUserName(value);
                  //   },
                  // ),
                  // UserProfileItem(
                  //   isEditable: true,
                  //   label: 'address'.tr,
                  //   onSubmit: (value) {
                  //     controller.changeUserName(value);
                  //   },
                  // ),
                  TextButton(
                      onPressed: controller.logout,
                      child: CustomText(text: 'sign_out'.tr,))
                ],
              );
            }
          ),
        ),
        SizedBox(height: 40,),
        Footer()
      ],
    );
  }
}