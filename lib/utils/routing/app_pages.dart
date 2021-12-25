import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: '/',
      page: () => RootView(),
      binding: RootBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
          middlewares: [
            //only enter this route when not authed
            EnsureNotAuthedMiddleware(),
          ],
          name: _Paths.LOGIN,
          page: () => LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          preventDuplicates: true,
          name: _Paths.HOME,
          page: () => HomeView(),
          bindings: [
            HomeBinding(),
          ],
          title: null,
          children: [
            GetPage(
              name: _Paths.DASHBOARD,
              page: () => DashboardView(),
              binding: DashboardBinding(),
            ),
            GetPage(
              middlewares: [
                //only enter this route when authed
                EnsureAuthMiddleware(),
              ],
              name: _Paths.PROFILE,
              page: () => ProfileView(),
              title: 'Profile',
              transition: Transition.size,
              binding: ProfileBinding(),
            ),
            GetPage(
              name: _Paths.PRODUCTS,
              page: () => ProductsView(),
              title: 'Products',
              transition: Transition.zoom,
              binding: ProductsBinding(),
              children: [
                GetPage(
                  name: _Paths.PRODUCT_DETAILS,
                  page: () => ProductDetailsView(),
                  binding: ProductDetailsBinding(),
                  middlewares: [
                    //only enter this route when authed
                    EnsureAuthMiddleware(),
                  ],
                ),
              ],
            ),
          ],
        ),
        GetPage(
          name: _Paths.SETTINGS,
          page: () => SettingsView(),
          binding: SettingsBinding(),
        ),
      ],
    ),
  ];
}