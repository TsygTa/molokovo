import 'package:flutter/material.dart';
import 'package:site_molokovo/widgets/constrained_widget.dart';

class PageLayout extends StatelessWidget {
  PageLayout({required this.body, required this.footer});
  final Widget body;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: constraints.copyWith(
                minHeight: constraints.maxHeight,
                maxHeight: double.infinity,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    ConstrainedWidget(body),
                    Expanded(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: footer
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

}