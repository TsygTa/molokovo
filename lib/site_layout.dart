import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/pages/about_us_page.dart';
import 'package:site_molokovo/pages/contacts_page.dart';
import 'package:site_molokovo/pages/delivery_page.dart';
import 'package:site_molokovo/pages/products_page.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';
import 'package:site_molokovo/widgets/site_menu.dart';
import 'package:site_molokovo/widgets/top_navigation_bar.dart';

import 'constants/app_route.dart';
import 'controllers/app_pages_controllers.dart';


class SiteLayout extends GetView<AppPagesController> {

  @override
  Widget build(BuildContext context) {

    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      body: GetBuilder<AppPagesController>(
          builder: (_) {
            if(controller.currentPage == AppRoute.delivery) {
              return DeliveryPage();
            } else if(controller.currentPage == AppRoute.aboutUs) {
              return AboutUsPage();
            } else if(controller.currentPage == AppRoute.contacts) {
              return ContactsPage();
            }
            return ProductsPage();
          }
      ),
      drawer: ResponsiveWidget.isSmallScreen(context)
          ? Drawer(
              child: SiteMenu(isForDrawer: true, scaffoldKey: scaffoldKey,),
            )
          : null,
      endDrawer: Drawer(
        child: Container(child: CustomText(text: 'basket'.tr),),
      ),
    );
  }
}