import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';

extension GetExt on GetInterface {

  void appSnippet({String title = '', String message = '', String image = ''}) {
    if(isSnackbarOpen != null && isSnackbarOpen!) {
      Get.back();
    }
    snackbar(title, message,
      titleText: Text(title, style: TextStyle(color: Colors.red),),
      icon: image.isNotEmpty ? Image.asset(image) : null,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.fromLTRB(Get.width / 3, Get.height / 3, Get.width / 3, 0),
      padding: EdgeInsets.all(20),
      backgroundColor: Colors.white,
      isDismissible: true,
      animationDuration: Duration(seconds: 0),
      duration: Duration(seconds: 1),
      boxShadows: [BoxShadow(color: Colors.grey, offset: Offset(0,2.5), spreadRadius: 0.5, blurRadius: 10)],
    );
  }

  void appDialog_0({String title = '', String image = ''}) {
    if(Get.isDialogOpen!= null && Get.isDialogOpen!) {
      Get.back();
    }
    defaultDialog(
      contentPadding: EdgeInsets.all(10),
      title: title,
      titleStyle: TextStyle(color: Color(activeColor), fontSize: 14),
      content: image.isNotEmpty ? Image.asset(image) : null,
      backgroundColor: Colors.white,
      barrierDismissible: true,
    );
  }

  void appDialog(String title, String message) {
    defaultDialog(
      contentPadding: const EdgeInsets.all(10),
      title: title,
      titleStyle: const TextStyle(color: Colors.red),
      content: CustomText(text: message,),
      backgroundColor: const Color(lightColor),
      barrierDismissible: false,
      confirm: TextButton(
        child: const Text('OK', style: TextStyle(color: Color(activeColor)),),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
