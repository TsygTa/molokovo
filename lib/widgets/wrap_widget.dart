import 'package:flutter/material.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';

class WrapWidget extends StatelessWidget {
  WrapWidget({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isLargeScreen(context) //|| ResponsiveWidget.isMediumScreen(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
        )
        : Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        );
  }
}