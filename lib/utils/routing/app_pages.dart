import 'package:get/get.dart';
import 'package:site_molokovo/controllers/bindings/products_bindings.dart';
import 'package:site_molokovo/controllers/bindings/root_bindings.dart';
import 'package:site_molokovo/pages/about_us_page.dart';
import 'package:site_molokovo/pages/contacts_page.dart';
import 'package:site_molokovo/pages/delivery_page.dart';
import 'package:site_molokovo/pages/products/products_page.dart';
import 'package:site_molokovo/pages/user_profile/user_profile_page.dart';
import 'package:site_molokovo/site_layout.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.home;

  static final routes = [
    GetPage(
      name: '/',
      page: () => SiteLayout(),
      binding: RootBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
          name: _Paths.home,
          page: () => ProductsPage(),
          binding: ProductsBinding(),
        ),
        GetPage(
          name: _Paths.products,
          page: () => ProductsPage(),
          binding: ProductsBinding(),
          // children: [
          //   GetPage(
          //     name: _Paths.productDetails,
          //     page: () => ProductDetailsPage(),
          //     binding: ProductDetailsBinding(),
          //   ),
          // ],
        ),
        GetPage(
          name: _Paths.delivery,
          page: () => DeliveryPage(),
        ),
        GetPage(
          name: _Paths.aboutUs,
          page: () => AboutUsPage(),
        ),
        GetPage(
          name: _Paths.contacts,
          page: () => ContactsPage(),
        ),
        GetPage(
          name: _Paths.profile,
          page: () => UserProfilePage(),
        ),
      ],
    ),
  ];
}