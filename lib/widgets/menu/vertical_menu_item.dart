import 'package:flutter/material.dart';
import 'package:site_molokovo/constants/app_menu.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';

class VerticalMenuItem extends StatelessWidget {

  const VerticalMenuItem({required this.item, required this.onTap});

  final AppMenu item;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(30, 20, 0, 0),
      leading: Icon(item.icon, size: 30, color: Color(activeColor),),
      title: CustomText(text: item.displayName,),
      onTap: onTap,
    );
  }
}