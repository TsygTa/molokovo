import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/widgets/custom_button.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/login/i_agree_item.dart';
import 'package:site_molokovo/widgets/login/pin_widget.dart';

class CodeForm extends StatefulWidget {
  const CodeForm(this.phone,
      {required this.onCheckCode, required this.onChangePhone,
        this.isWrongCode = false,
        required this.onRepeatSendCode});
  final String phone;
  final bool isWrongCode;
  final void Function(String phone) onCheckCode;
  final void Function() onChangePhone;
  final void Function(String phone) onRepeatSendCode;

  @override
  State<CodeForm> createState() => _CodeFormState();
}

class _CodeFormState extends State<CodeForm> {

  Timer? _timer;
  int _currentTime = 60;

  void _setTime(Timer timer) {
    if(_currentTime > 0) {
      setState(() {
        _currentTime--;
      });
    } else {
      _stopTimer();
    }
  }

  void _startTimer() {
    setState(() {
      _currentTime = 60;
      _timer ??= Timer.periodic(Duration(seconds: 1), _setTime);
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _timer = null;
    });
  }

  @override
  void dispose() {
    _stopTimer();
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
              IconButton(onPressed: () => Get.back(),
                  icon: Icon(Icons.close,size: 30, color: Color(activeColor),),
                splashRadius: 15,)
            ],
          ),
          SizedBox(height: 10,),
          CustomText(text: 'code_is_sent'.tr,),
          SizedBox(height: 10,),
          Row(
            children: [
              CustomText(text: widget.phone, fontSize: 18,),
              TextButton(
                  onPressed: widget.onChangePhone,
                  child: CustomText(text: 'change'.tr, fontSize: 18, color: Color(activeColor),))
            ],
          ),
          SizedBox(height: 10,),
          PinWidget(
              isWrongCode: widget.isWrongCode,
              onComplete: (value) {
                widget.onCheckCode(value);
              }
          ),
          SizedBox(height: 10,),
          _timer == null
          ? CustomButton(
              title: 'repeat_code'.tr,
              onPressed: () {
                widget.onRepeatSendCode(widget.phone);
                _startTimer();
              },
            )
          : CustomButton(
            title: 'repeat_code'.tr + ' ' + 'in_preposition'.tr + ' ' + _currentTime.toString() + ' ' + 'seconds'.tr,
            onPressed: null,
          ),
          SizedBox(height: 5,),
          IAgreeItem(),
        ],
      ),
    );
  }
}