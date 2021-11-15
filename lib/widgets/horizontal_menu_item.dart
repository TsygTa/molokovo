import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/app_route.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/controllers/app_pages_controllers.dart';
import 'package:site_molokovo/widgets/custom_text.dart';

class HorizontalMenuItem extends GetView<AppPagesController> {

  HorizontalMenuItem({required this.item, required this.onTap});

  final AppRoute item;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GetBuilder<AppPagesController>(
          builder: (event) {
            return CustomText(text: item.displayName,
              color: event.currentPage == item ? Color(activeColor) : Color(darkColor));
          }
      ),
      onTap: onTap,
    );
  }
}