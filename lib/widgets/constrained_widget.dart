import 'package:flutter/material.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';

class ConstrainedWidget extends StatelessWidget {

  const ConstrainedWidget(this.item);
  final Widget item;

  @override
  Widget build(BuildContext context) {
    int padding = ((ResponsiveWidget.isSmallScreen(context) ? mainPaddingRatioSmall : mainPaddingRatio) * 100).toInt();
    return Row(
      children: [
        Flexible(flex: padding, child: Container(color: Color(lightColor))),
        Flexible(flex: 100 - 2 * padding,
          child: item,
        ),
        Flexible(flex: padding, child: Container(color: Color(lightColor))),
      ],
    );
  }
}