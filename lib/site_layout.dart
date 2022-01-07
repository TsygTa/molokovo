import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/app_menu.dart';
import 'package:site_molokovo/pages/about_us_page.dart';
import 'package:site_molokovo/pages/contacts_page.dart';
import 'package:site_molokovo/pages/delivery_page.dart';
import 'package:site_molokovo/pages/products/products_page.dart';
import 'package:site_molokovo/pages/user_profile/user_profile_page.dart';
import 'package:site_molokovo/widgets/basket/basket_form.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';
import 'package:site_molokovo/widgets/menu/site_menu.dart';
import 'package:site_molokovo/widgets/top_navigation_bar.dart';
import 'controllers/menu_pages_controllers.dart';
import 'models/app_route_path.dart';


class SiteLayout extends GetView<MenuPagesController> {

  @override
  Widget build(BuildContext context) {

    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        return Scaffold(
          key: scaffoldKey,
          appBar: topNavigationBar(context, scaffoldKey),
          body: GetBuilder(
              builder: (_) {
                if(controller.currentPage == AppMenu.delivery) {
                  return DeliveryPage();
                } else if(controller.currentPage == AppMenu.aboutUs) {
                  return AboutUsPage();
                } else if(controller.currentPage == AppMenu.contacts) {
                  return ContactsPage();
                } else if(controller.currentPage == AppMenu.userProfile) {
                  return UserProfilePage();
                }
                return ProductsPage();
              }
          ),
          drawer: ResponsiveWidget.isSmallScreen(context)
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