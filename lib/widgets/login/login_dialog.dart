import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/controllers/auth_controller.dart';
import 'package:site_molokovo/widgets/login/code_form.dart';
import 'package:site_molokovo/widgets/login/phone_form.dart';

class LoginDialog extends GetView<AuthController> {
  late String? _phone;

  LoginDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: loginWindowWidth,
        height: loginWindowHeight,
        child: GetBuilder<AuthController>(
            builder: (_) {
              if (controller.authState == AuthState.init) {
                return PhoneForm((phone) {
                  _phone = phone;
                  controller.sendCode(phone);
                });
              } else if (controller.authState == AuthState.codeSentFailed) {
                return PhoneForm((phone) {
                  controller.sendCode(phone);
                }, isSendCodeFailed: true);
              } else if (controller.authState == AuthState.codeSent && _phone != null) {
                return CodeForm(_phone!,
                  onCheckCode: (code) {
                    controller.checkCode(phone: _phone!, code: code);
                  },
                  onChangePhone: () {
                    controller.authInit();
                  },
                  onRepeatSendCode: (phone) {
                    controller.sendCode(phone);
                  },
                );
              } else if(controller.authState == AuthState.failed && _phone != null) {
                return CodeForm(_phone!,
                  isWrongCode: true,
                  onCheckCode: (code) {
                    controller.checkCode(phone: _phone!, code: code);
                  },
                  onChangePhone: () {
                    controller.authInit();
                  },
                  onRepeatSendCode: (phone) {
                    controller.sendCode(phone);
                  },
                );
              } else if(controller.authState == AuthState.success) {
                Get.back();
                return Container();
              } else {
                return Container();
              }
            }
        ),
      ),
    );
  }
}

Future<void> showLoginDialog() async {
  await Get.dialog(
      AlertDialog(
        contentPadding: const EdgeInsets.all(20),
        elevation: 1.0,
        content: SizedBox(
            width: loginWindowWidth,
            height: loginWindowHeight,
            child: LoginDialog(key: UniqueKey())
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),),
      )
  );
}