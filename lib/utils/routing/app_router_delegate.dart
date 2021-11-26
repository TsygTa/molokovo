import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/app_route.dart';
import 'package:site_molokovo/controllers/app_pages_controllers.dart';
import 'package:site_molokovo/site_layout.dart';

class AppRouterDelegate extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppPagesController _pagesController = Get.find<AppPagesController>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: SiteLayout(),
        ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoute route) async {
    _pagesController.setPage(route);
  }

}