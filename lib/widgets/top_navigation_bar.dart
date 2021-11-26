import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/controllers/auth_controller.dart';
import 'package:site_molokovo/widgets/basket_button.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';
import 'package:site_molokovo/widgets/signin_button.dart';
import 'package:site_molokovo/widgets/menu/site_menu.dart';
import 'package:site_molokovo/widgets/user_profile_button.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
  double padding = context.width * (ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isMediumScreen(context)
      ? mainPaddingRatioSmall : mainPaddingRatio);
  return AppBar(
      elevation: 1,
      backgroundColor: const Color(lightColor),
      leadingWidth: ResponsiveWidget.isLargeScreen(context) ? context.width * mainPaddingRatio - 50 : null,
      leading: ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isMediumScreen(context)
          ? IconButton(
              icon: const Icon(Icons.menu, color: Color(activeColor), size: 30,),
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              })
          : SizedBox(width: padding,),
      automaticallyImplyLeading: false,
      titleSpacing: ResponsiveWidget.isSmallScreen(context) ? 12 : 50,
      title: SiteMenu(),
      actions: [
        GetBuilder<AuthController>(
          builder: (controller) {
            return controller.authState == AuthState.success ? UserProfileButton() : SignInButton();
          }
        ),
        SizedBox(width: ResponsiveWidget.isSmallScreen(context) ? 10 : 20,),
        BasketButton(scaffoldKey),
        SizedBox(width: padding,)
      ]
  );

}