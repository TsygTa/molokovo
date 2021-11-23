import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/pages/about_us_page.dart';
import 'package:site_molokovo/pages/contacts_page.dart';
import 'package:site_molokovo/pages/delivery_page.dart';
import 'package:site_molokovo/pages/products/products_page.dart';
import 'package:site_molokovo/pages/user_profile/user_profile_page.dart';
import 'package:site_molokovo/site_layout.dart';

enum AppRoute {home, products, delivery, aboutUs, contacts, userProfile}

extension AppRouteExt on AppRoute {
  String get displayName {
    switch(this) {
      case AppRoute.home:
        return '/';
      case AppRoute.products:
        return 'products'.tr;
      case AppRoute.delivery:
        return 'delivery'.tr;
      case AppRoute.aboutUs:
        return 'about_us'.tr;
      case AppRoute.contacts:
        return 'contacts'.tr;
      case AppRoute.userProfile:
        return 'user_profile'.tr;
    }
  }

  String get route {
    switch(this) {
      case AppRoute.home:
        return '/';
      case AppRoute.products:
        return '/products';
      case AppRoute.delivery:
        return '/delivery';
      case AppRoute.aboutUs:
        return '/about_us';
      case AppRoute.contacts:
        return '/contacts';
      case AppRoute.userProfile:
        return '/user_profile'.tr;
    }
  }

  IconData get icon {
    switch (this) {
      case AppRoute.home:
        return Icons.home;
      case AppRoute.products:
        return Icons.home;
      case AppRoute.delivery:
        return Icons.drive_eta;
      case AppRoute.aboutUs:
        return Icons.info_outline;
      case AppRoute.contacts:
        return Icons.contact_mail_outlined;
      case AppRoute.userProfile:
        return Icons.face;
    }
  }

  Widget get page {
    switch (this) {
      case AppRoute.home:
        return SiteLayout();
      case AppRoute.products:
        return ProductsPage();
      case AppRoute.delivery:
        return DeliveryPage();
      case AppRoute.aboutUs:
        return AboutUsPage();
      case AppRoute.contacts:
        return ContactsPage();
      case AppRoute.userProfile:
        return UserProfilePage();
    }
  }
}