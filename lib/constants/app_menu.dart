import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/routes/app_pages.dart';

enum AppMenu {home, products, delivery, aboutUs, contacts, userProfile}

extension AppRouteExt on AppMenu {
  String get displayName {
    switch(this) {
      case AppMenu.home:
        return '';
      case AppMenu.products:
        return 'products'.tr;
      case AppMenu.delivery:
        return 'delivery'.tr;
      case AppMenu.aboutUs:
        return 'about_us'.tr;
      case AppMenu.contacts:
        return 'contacts'.tr;
      case AppMenu.userProfile:
        return 'user_profile'.tr;
    }
  }

  IconData get icon {
    switch (this) {
      case AppMenu.home:
        return Icons.home;
      case AppMenu.products:
        return Icons.home;
      case AppMenu.delivery:
        return Icons.drive_eta;
      case AppMenu.aboutUs:
        return Icons.info_outline;
      case AppMenu.contacts:
        return Icons.contact_mail_outlined;
      case AppMenu.userProfile:
        return Icons.face;
    }
  }

  String get route {
    switch(this) {
      case AppMenu.home:
        return Routes.home;
      case AppMenu.products:
        return Routes.products;
      case AppMenu.delivery:
        return Routes.delivery;
      case AppMenu.aboutUs:
        return Routes.aboutUs;
      case AppMenu.contacts:
        return Routes.contacts;
      case AppMenu.userProfile:
        return Routes.profile;
    }
  }

  String get orderPageRoute {
    return Routes.order;
  }
}