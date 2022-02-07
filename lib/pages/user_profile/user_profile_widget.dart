import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/controllers/auth_controller.dart';
import 'package:site_molokovo/pages/user_profile/user_profile_item.dart';

class UserProfileWidget extends GetView<AuthController> {

  final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (_) {
          if(controller.user == null) return Container();
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserProfileItem(
                isEditable: true,
                label: 'user_name'.tr + '*',
                initialValue: controller.user!.name,
                onSubmit: (value) {
                  controller.changeUserName(value);
                },
              ),
              UserProfileItem(
                label: 'phone'.tr,
                isEditable: false,
                initialValue: controller.user!.phone,
              ),
              UserProfileItem(
                isEditable: true,
                label: 'email'.tr + '*',
                initialValue: controller.user!.email,
                regExp: emailRegExp,
                onSubmit: (value) {
                  controller.changeUserEmail(value);
                },
              ),
              UserProfileItem(
                isEditable: true,
                maxLines: 3,
                initialValue: controller.user!.address,
                label: 'delivery_address'.tr + '*',
                onSubmit: (value) {
                  controller.changeUserAddress(value);
                },
              ),
            ],
          );
      }
    );
  }
}