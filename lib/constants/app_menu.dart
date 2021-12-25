import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/pages/about_us_page.dart';
import 'package:site_molokovo/pages/contacts_page.dart';
import 'package:site_molokovo/pages/delivery_page.dart';
import 'package:site_molokovo/pages/products/products_page.dart';
import 'package:site_molokovo/pages/user_profile/user_profile_page.dart';
import 'package:site_molokovo/site_layout.dart';

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
}

abstract class Routes {
  static const HOME = _Paths.HOME;

  static const PROFILE = _Paths.HOME + _Paths.PROFILE;
  static const SETTINGS = _Paths.SETTINGS;

  static const PRODUCTS = _Paths.HOME + _Paths.PRODUCTS;

  static const LOGIN = _Paths.LOGIN;
  static const DASHBOARD = _Paths.HOME + _Paths.DASHBOARD;
  Routes._();
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  static String PRODUCT_DETAILS(String productId) => '$PRODUCTS/$productId';
}

abstract class _Paths {
  static const HOME = '/home';
  static const PRODUCTS = '/products';
  static const PROFILE = '/profile';
  static const SETTINGS = '/settings';
  static const PRODUCT_DETAILS = '/:productId';
  static const LOGIN = '/login';
  static const DASHBOARD = '/dashboard';
}