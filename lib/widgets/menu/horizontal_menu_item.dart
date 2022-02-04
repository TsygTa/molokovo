import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/app_menu.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';

class HorizontalMenuItem extends StatelessWidget {

  HorizontalMenuItem({required this.item, required this.onTap});

  final AppMenu item;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GetRouterOutlet.builder(
          builder: (context, delegate, current) {
            return CustomText(text: item.displayName,
              color: current?.location == item.route  ? Color(activeColor) : Color(darkColor));
          }
      ),
      onTap: onTap,
    );
  }
}