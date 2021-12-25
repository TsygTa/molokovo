import 'package:site_molokovo/constants/app_menu.dart';

class AppRoutePath {
  final int? productId;
  final AppMenu? menuItem;
  final bool isUnknown;

  AppRoutePath.home()
      : productId = null,
        menuItem = AppMenu.home,
        isUnknown = false;

  AppRoutePath.products()
      : productId = null,
        menuItem = AppMenu.products,
        isUnknown = false;

  AppRoutePath.delivery()
      : productId = null,
        menuItem = AppMenu.delivery,
        isUnknown = false;

  AppRoutePath.aboutUs()
      : productId = null,
        menuItem = AppMenu.aboutUs,
        isUnknown = false;

  AppRoutePath.contacts()
      : productId = null,
        menuItem = AppMenu.contacts,
        isUnknown = false;

  AppRoutePath.userProfile()
      : productId = null,
        menuItem = AppMenu.userProfile,
        isUnknown = false;

  AppRoutePath.productDetails(this.productId) : menuItem = null, isUnknown = false;

  AppRoutePath.unknown()
      : productId = null,
        menuItem = null,
        isUnknown = true;

  bool get isProductDetailsPage => productId != null;
}