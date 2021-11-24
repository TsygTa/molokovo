import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/controllers/auth_controller.dart';
import 'package:site_molokovo/pages/user_profile/user_profile_item.dart';
import 'package:site_molokovo/widgets/constrained_widget.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/footer.dart';

class UserProfilePage extends GetView<AuthController> {

  final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ConstrainedWidget(
          GetBuilder<AuthController>(
            builder: (_) {
              if(controller.user == null) return Container();
              return SizedBox(
                height: context.height * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'user_profile'.tr, fontSize: 24, fontWeight: FontWeight.bold,),
                    UserProfileItem(
                      isEditable: true,
                      label: 'user_name'.tr,
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
                      label: 'email'.tr,
                      initialValue: controller.user!.email,
                      regExp: emailRegExp,
                      onSubmit: (value) {
                        controller.changeUserEmail(value);
                      },
                    ),
                    UserProfileItem(
                      isEditable: true,
                      initialValue: controller.user!.address,
                      label: 'address'.tr,
                      onSubmit: (value) {
                        controller.changeUserAddress(value);
                      },
                    ),
                    TextButton(
                        onPressed: controller.logout,
                        child: CustomText(text: 'sign_out'.tr, fontSize: 20,))
                  ],
                ),
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