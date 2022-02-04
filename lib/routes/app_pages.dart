import 'package:get/get.dart';
import 'package:site_molokovo/controllers/bindings/product_details_bindings.dart';
import 'package:site_molokovo/controllers/bindings/products_bindings.dart';
import 'package:site_molokovo/controllers/bindings/root_bindings.dart';
import 'package:site_molokovo/pages/about_us/about_us_page.dart';
import 'package:site_molokovo/pages/contacts/contacts_page.dart';
import 'package:site_molokovo/pages/delivery/delivery_page.dart';
import 'package:site_molokovo/pages/order/order_page.dart';
import 'package:site_molokovo/pages/products/product_details_page.dart';
import 'package:site_molokovo/pages/products/products_page.dart';
import 'package:site_molokovo/pages/unknown_page.dart';
import 'package:site_molokovo/pages/user_profile/user_profile_page.dart';
import 'package:site_molokovo/routes/auth_middleware.dart';
import 'package:site_molokovo/site_layout.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.products;
  static const order = Routes.order;

  static final List<GetPage> routes = [
    GetPage(
        name: '/',
        page: () => SiteLayout(),
        binding: RootBinding(),
        participatesInRootNavigator: true,
        preventDuplicates: true,
        middlewares: [
          UnknownPageMiddleware()
        ],
        children: [
          GetPage(
            name: _Paths.home,
            page: () => SiteLayout(),
            middlewares: [
              UnknownPageMiddleware()
            ],
            children: [
              GetPage(
                name: _Paths.products,
                page: () => ProductsPage(),
                binding: ProductsBinding(),
                children: [
                  GetPage(
                    name: _Paths.productDetails,
                    page: () => ProductDetailsPage(),
                    binding: ProductDetailsBinding(),
                  ),
                ],
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
                middlewares: [EnsureAuthMiddleware()]
              ),
              GetPage(
                name: _Paths.unknown,
                page: () => UnknownPage(),
              ),
              GetPage(
                name: _Paths.order,
                page: () => OrderPage(),
                middlewares: [EnsureAuthMiddleware()]
              ),
            ],
          ),
        ]
    ),
  ];
}

class UnknownPageMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {

    if (route.location != '/' && route.location != Routes.home
        && route.location != null && !route.location!.contains(Routes.products) &&  route.location != Routes.delivery
        && route.location != Routes.contacts && route.location != Routes.aboutUs
        && route.location != Routes.profile && route.location != Routes.order) {
      return GetNavConfig.fromRoute(Routes.unknown);
    }
    return await super.redirectDelegate(route);
  }
}