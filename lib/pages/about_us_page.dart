import 'package:flutter/material.dart';
import 'package:site_molokovo/widgets/constrained_widget.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedWidget(
      LayoutBuilder(
          builder: (context, constraints) {
            return Image.asset(
                'assets/green_cows.png',
                height: constraints.maxHeight,
                fit: BoxFit.fitHeight);
          }
      ),
    );
  }
}