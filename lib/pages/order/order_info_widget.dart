import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/pages/user_profile/user_profile_widget.dart';
import 'package:site_molokovo/widgets/page_title_widget.dart';

class OrderInfoWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageTitleWidget(title: 'order'.tr),
        UserProfileWidget(),
      ],
    );
  }
}