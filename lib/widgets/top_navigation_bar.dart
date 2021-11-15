import 'package:flutter/material.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/basket_button.dart';
import 'package:site_molokovo/widgets/constrained_widget.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';
import 'package:site_molokovo/widgets/sigin_button.dart';
import 'package:site_molokovo/widgets/site_menu.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      elevation: 1,
      backgroundColor: Color(lightColor),
      leading: ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isMediumScreen(context)
          ? Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                  key: Key('menuButton'),
                  icon: Icon(Icons.menu, color: Color(activeColor), size: 30,),
                  onPressed: () {
                    key.currentState!.openDrawer();
                  }),
            )
          : null,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: ConstrainedWidget(SiteMenu()),
      actions: ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isMediumScreen(context)
        ? [SignInButton(), BasketButton(key)]
        : null,
    );