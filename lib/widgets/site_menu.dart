import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/app_route.dart';
import 'package:site_molokovo/controllers/app_pages_controllers.dart';
import 'package:site_molokovo/widgets/basket_button.dart';
import 'package:site_molokovo/widgets/horizontal_menu_item.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';
import 'package:site_molokovo/widgets/signin_button.dart';
import 'package:site_molokovo/widgets/vertical_menu_item.dart';
import 'package:url_launcher/url_launcher.dart';

class SiteMenu extends StatelessWidget {
  SiteMenu({this.isForDrawer = false, this.scaffoldKey});
  final bool isForDrawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  final AppPagesController _pagesController = Get.find<AppPagesController>();

  void _onTap(BuildContext context, AppRoute item) {
    switch(item) {
      case AppRoute.home:
      case AppRoute.products:
      case AppRoute.delivery:
      case AppRoute.aboutUs:
      case AppRoute.contacts:
        if(ResponsiveWidget.isSmallScreen(context) && scaffoldKey != null) {
          if (scaffoldKey!.currentState!.hasEndDrawer) {
            Navigator.of(context).pop();
          }
        }
        _pagesController.setPage(item);
        break;
    }
  }
  Future<void> _launch(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        headers: <String, String>{'Authorization': 'Basic YnVoMjptYXJzZWw='},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    if(isForDrawer) {
      return ListView(
        children: AppRoute.values.where((e) => e != AppRoute.home).map<Widget>((item) => VerticalMenuItem(item: item, onTap: (){
          _onTap(context, item);
        })).toList(),
      );
    } else if(ResponsiveWidget.isLargeScreen(context)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
            InkWell(
              child: Image.asset('assets/logo/logo_with_name.png'),
              onTap: (){
                _onTap(context, AppRoute.home);
              },)
          ]
          + AppRoute.values.where((e) => e != AppRoute.home).map((item) => HorizontalMenuItem(item: item, onTap: () {
            _onTap(context, item);
          })).toList()
          //+ [SignInButton(), BasketButton(scaffoldKey)],
      );
    } else {
      return Center(child: Image.asset('assets/logo/logo_with_name.png'),);
    }
  }
}