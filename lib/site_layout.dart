import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/routes/app_pages.dart';
import 'package:site_molokovo/widgets/basket/basket_form.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';
import 'package:site_molokovo/widgets/menu/site_menu.dart';
import 'package:site_molokovo/widgets/top_navigation_bar.dart';

class SiteLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        return Scaffold(
          key: scaffoldKey,
          appBar: topNavigationBar(context, scaffoldKey),
          body: GetRouterOutlet(
            initialRoute: AppPages.initial,
          ),
          drawer: ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isMediumScreen(context)
              ? Drawer(
                  child: SiteMenu(isForDrawer: true, scaffoldKey: scaffoldKey,),
                )
              : null,
          endDrawer: SizedBox(
            width: context.width / (ResponsiveWidget.isSmallScreen(context) ? 1 : 3),
            child: Drawer(
              child: BasketForm(),
            ),
          ),
        );
      }
    );
  }
}