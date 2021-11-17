import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/basket_button.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';
import 'package:site_molokovo/widgets/signin_button.dart';
import 'package:site_molokovo/widgets/site_menu.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
  double padding = context.width * (ResponsiveWidget.isCustomScreen(context)
      ? mainPaddingRatioSmall : mainPaddingRatio);
  return AppBar(
      elevation: 1,
      backgroundColor: Color(lightColor),
      leadingWidth: padding - 50 < 0 ? padding : padding - 50,
      leading: ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isMediumScreen(context)
          ? Padding(
              padding: const EdgeInsets.only(left: 5),
              child: IconButton(
                  icon: Icon(Icons.menu, color: Color(activeColor), size: 30,),
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  }),
            )
          : SizedBox(width: padding,),
      automaticallyImplyLeading: false,
      titleSpacing: 50,
      title: SiteMenu(),
      actions: [
        SignInButton(),
        SizedBox(width: 20,),
        BasketButton(scaffoldKey),
        SizedBox(width: padding,)
      ]
  );

}