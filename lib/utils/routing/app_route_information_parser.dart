import 'package:flutter/material.dart';
import 'package:site_molokovo/constants/app_route.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoute> {
  @override
  Future<AppRoute> parseRouteInformation(RouteInformation routeInformation) async {
    String? location = routeInformation.location;
    if( location != null) {
      if(location == AppRoute.products.route) {
        return AppRoute.products;
      } else if(location == AppRoute.contacts.route) {
        return AppRoute.contacts;
      } else if(location == AppRoute.delivery.route) {
        return AppRoute.delivery;
      } else if(location == AppRoute.aboutUs.route) {
        return AppRoute.aboutUs;
      }
    }
    return AppRoute.home;
  }

  @override
  RouteInformation restoreRouteInformation(AppRoute route) {
    return RouteInformation(location: route.route);
  }
}