import 'package:flutter/material.dart';
import 'package:site_molokovo/constants/style.dart';

class ConstrainedWidget extends StatelessWidget {

  ConstrainedWidget(this.item);
  final Widget item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(flex: 15, child: Container(color: Color(lightColor))),
        Flexible(flex: 70,
          child: item,
        ),
        Flexible(flex: 15, child: Container(color: Color(lightColor))),
      ],
    );
  }
}