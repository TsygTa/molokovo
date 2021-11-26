import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/utils/app_localizations.dart';
import 'package:site_molokovo/utils/routing/app_router_delegate.dart';
import 'package:site_molokovo/utils/routing/app_route_information_parser.dart';

import 'controllers/app_pages_controllers.dart';
import 'controllers/auth_controller.dart';
import 'controllers/basket_controller.dart';
import 'controllers/products_controller.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/Montserrat/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_montserrat_fonts'], license);
  });
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/Inter/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_lobster_fonts'], license);
  });
  Get.put(AppPagesController());
  Get.put(AuthController());
  Get.put(ProductsController());
  Get.put(BasketController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouterDelegate _routerDelegate = AppRouterDelegate();
  final AppRouteInformationParser _routeInformationParser = AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Молоково',
      onGenerateTitle: (BuildContext context) {
        return 'title'.tr;
      },
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
      translations: AppLocalizations(),
      locale: Get.deviceLocale,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(lightColor),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(activeColor),
        ),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ).apply(
            bodyColor: const Color(activeColor),
        ),
      ),
    );
  }
}