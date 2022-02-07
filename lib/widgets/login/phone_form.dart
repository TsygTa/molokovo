import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/widgets/custom_button.dart';
import 'package:site_molokovo/widgets/login/i_agree_item.dart';
import 'package:site_molokovo/widgets/login/phone_input_formatter.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';

class PhoneForm extends StatefulWidget {
  const PhoneForm(this.onSendCode, {this.isSendCodeFailed = false});
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
              CustomText(text: 'login_dialog_title'.tr, fontSize: 30,),
              IconButton(onPressed: () => Get.back(),
                  icon: Icon(Icons.close,size: 30, color: Color(activeColor),),
                splashRadius: 15,)
            ],
          ),
          SizedBox(height: 10,),
          CustomText(text: 'phone_number'.tr, fontSize:   14,),
          SizedBox(height: 10,),
          TextFormField(
            controller: _phoneController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(16),
              FilteringTextInputFormatter.digitsOnly,
              _phoneFormatter,
            ],
            autofocus: true,
            keyboardType: TextInputType.phone,
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
          SizedBox(height: 10,),
          CustomButton(
            title: 'send_code'.tr,
            onPressed: _isButtonEnabled
                ? () {
              widget.onSendCode(_phoneController.text);
            }
                : null,
          ),
          SizedBox(height: 5,),
          IAgreeItem(),
        ],
      ),
    );
  }
}