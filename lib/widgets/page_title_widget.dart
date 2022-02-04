import 'package:flutter/material.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';

class PageTitleWidget extends StatelessWidget{
  const PageTitleWidget({required this.title, this.icon, this.fontSize = 36, this.isBorder = true});
  final String title;
  final IconData? icon;
  final double fontSize;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.fromLTRB(0, 60, 0, 60),
        padding: isBorder ? const EdgeInsets.fromLTRB(20, 0, 0, 0) : const EdgeInsets.all(0),
        decoration: isBorder
            ? const BoxDecoration(
                border: Border(
                    left: BorderSide(color: Color(activeColor), width: 3)
                )
              )
            : null,
        child: Row(
          children: [
            CustomText(text: title, fontSize: fontSize,),
            const SizedBox(width: 10,),
            Icon(icon, size: 36, color: Color(activeColor),)
          ],
        )
    );
  }

}