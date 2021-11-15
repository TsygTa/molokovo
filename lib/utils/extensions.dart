import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:site_molokovo/constants/style.dart';

extension GetExt on GetInterface {

  void appSnippet({String title = '', String message = '', String image = ''}) {
    if(this.isSnackbarOpen != null && this.isSnackbarOpen!) {
      Get.back();
    }
    this.snackbar(title, message,
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

  void appDialog({String title = '', String image = ''}) {
    if(Get.isDialogOpen!= null && Get.isDialogOpen!) {
      Get.back();
    }
    this.defaultDialog(
      contentPadding: EdgeInsets.all(10),
      title: title,
      titleStyle: TextStyle(color: Color(activeColor), fontSize: 14),
      content: image.isNotEmpty ? Image.asset(image) : null,
      backgroundColor: Colors.white,
      barrierDismissible: true,
    );
  }
}