import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/controllers/auth_controller.dart';
import 'package:site_molokovo/widgets/login/code_form.dart';
import 'package:site_molokovo/widgets/login/phone_form.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';

class LoginDialog extends GetView<AuthController> {

  late String? _phone;

  @override
  Widget build(BuildContext context) {
    double divider = ResponsiveWidget.isSmallScreen(context) ? 2 : 4;
    return SizedBox(
      width: context.width / divider,
      height: context.height / divider,
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
              }, isSendCodeFailed: true,);
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
              Navigator.pop(context);
              return Container();
            } else {
              return Container();
            }
          }
      ),
    );
  }
}

Future<void> showLoginDialog(BuildContext context) async {

  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(20),
          children: <Widget>[
            LoginDialog()
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),),
        );
      }
  );
}