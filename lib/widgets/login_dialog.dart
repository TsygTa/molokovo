import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/controllers/auth_controller.dart';
import 'package:site_molokovo/widgets/custom_button.dart';
import 'package:site_molokovo/widgets/phone_input_formatter.dart';
import 'package:site_molokovo/widgets/pin_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';

class LoginDialog extends GetView<AuthController> {

  late String? _phone;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.height / 3,
      height: context.height / 3,
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
            } else if (controller.authState == AuthState.codeSent) {
              if(_phone == null) {
                return Container();
              } else {
                return CodeForm(_phone!, onCheckCode: (code) {
                  controller.checkCode(phone: _phone!, code: code);
                }, onChangePhone: () {
                  controller.authInit();
                });
              }
            } else {
              if(_phone == null) {
                return Container();
              } else {
                return CodeForm(_phone!, isWrongCode: true, onCheckCode: (code) {
                  controller.checkCode(phone: _phone!, code: code);
                }, onChangePhone: () {
                  controller.authInit();
                });
              }
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
          contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 40),
          insetPadding: EdgeInsets.all(8),
          children: <Widget>[
            LoginDialog()
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),),
        );
      }
  );
}

class PhoneForm extends StatefulWidget {
  PhoneForm(this.onSendCode, {this.isSendCodeFailed = false});
  final void Function(String phone) onSendCode;
  final bool isSendCodeFailed;
  @override
  State<PhoneForm> createState() => _PhoneFormState();
}
class _PhoneFormState extends State<PhoneForm> {

  static final RegExp _phoneRegExp = RegExp(
    r'^(\+7|7|8)?[\s\-]?\(?[489][0-9]{2}\)?[\s\-]?[0-9]{3}[\s\-]?[0-9]{2}[\s\-]?[0-9]{2}$',
  );

  final TextEditingController _phoneController = TextEditingController();
  final _phoneFormatter = PhoneInputFormatter();

  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(text: 'login_dialog_title'.tr, fontSize:   30,),
              IconButton(onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close,size: 30, color: Color(activeColor),))
            ],
          ),
          CustomText(text: 'phone_number'.tr, fontSize:   14,),
          TextFormField(
            controller: _phoneController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(16),
              FilteringTextInputFormatter.digitsOnly,
              _phoneFormatter,
            ],
            autofocus: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              bool isValid = value != null && _phoneRegExp.hasMatch(value);
              if (isValid != _isButtonEnabled) {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  setState(() {
                    _isButtonEnabled = value != null && _phoneRegExp.hasMatch(value);
                  });
                });
              }
            },
            autocorrect: false,
            textAlignVertical: TextAlignVertical.bottom,
            maxLines: 1,
            style: TextStyle(fontSize: 18, color: Color(darkColor)),
            decoration: InputDecoration(
              hintText: '+7 XXX XXX-XX-XX',
              hintStyle: TextStyle(color: Color(darkColor).withOpacity(0.3)),
              isDense: false,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(activeColor),)
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          widget.isSendCodeFailed
          ? CustomText(text: 'send_code_failed'.tr, color: Colors.red,)
          : SizedBox.shrink(),
          CustomButton(
            title: 'send_code'.tr,
            onPressed: _isButtonEnabled
                ? () {
                    widget.onSendCode(_phoneController.text);
                  }
                : null,
          ),
          InkWell(
            child: CustomText(text: 'I_agree'.tr, fontSize: 14,
              color: Color(activeColor),),
            onTap: () {
              //launch('https://www.kgk-global.com/offer');
            },
          ),

        ],
      ),
    );
  }
}

class CodeForm extends StatelessWidget {
  CodeForm(this.phone,
      {required this.onCheckCode, required this.onChangePhone, this.isWrongCode = false});
  final String phone;
  final bool isWrongCode;
  final void Function(String phone) onCheckCode;
  final void Function() onChangePhone;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(text: 'login_dialog_title'.tr, fontSize:   30,),
              IconButton(onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close,size: 30, color: Color(activeColor),))
            ],
          ),
          CustomText(text: 'code_is_sent'.tr, fontSize:   14,),
          Row(
            children: [
              CustomText(text: phone, fontSize:   14,),
              TextButton(
                  onPressed: onChangePhone,
                  child: CustomText(text: 'change'.tr, fontSize: 14, color: Color(activeColor),))
            ],
          ),
          // PinWidget(
          //   pinColor: controller.authState == AuthState.codeSentFailed ? Colors.red : const Color(darkColor),
          //   onComplete: (value) {
          //   controller.setCode(value);
          // },),
          isWrongCode
              ? CustomText(text: 'auth_failed'.tr, color: Colors.red,)
              : SizedBox.shrink(),
          CustomButton(
            title: 'repeat_code'.tr,
            onPressed: null,
          ),
          InkWell(
            child: CustomText(text: 'I_agree'.tr, fontSize: 14,
              color: Color(activeColor)),
            onTap: () {
              //launch('https://www.kgk-global.com/offer');
            },
          ),

        ],
      ),
    );
  }
}