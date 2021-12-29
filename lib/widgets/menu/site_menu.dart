import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/app_menu.dart';
import 'package:site_molokovo/controllers/menu_pages_controllers.dart';
import 'package:site_molokovo/widgets/menu/horizontal_menu_item.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';
import 'package:site_molokovo/widgets/menu/vertical_menu_item.dart';
import 'package:url_launcher/url_launcher.dart';

class SiteMenu extends StatelessWidget {
  SiteMenu({this.isForDrawer = false, this.scaffoldKey});
  final bool isForDrawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  final AppPagesController _pagesController = Get.find<AppPagesController>();

  void _onTap(BuildContext context, AppMenu item) {
    switch(item) {
      case AppMenu.userProfile:
        break;
      case AppMenu.home:
      case AppMenu.products:
      case AppMenu.delivery:
      case AppMenu.aboutUs:
      case AppMenu.contacts:
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
        children: AppMenu.values.where((e) => e != AppMenu.home && e != AppMenu.userProfile).map<Widget>((item) => VerticalMenuItem(item: item, onTap: (){
          _onTap(context, item);
        })).toList(),
      );
    } else if(ResponsiveWidget.isLargeScreen(context)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
            InkWell(
              child: Image.asset('assets/logo/logo_molokovo.png'),
              onTap: (){
                _onTap(context, AppMenu.home);
              },)
          ]
          + AppMenu.values.where((e) => e != AppMenu.home && e != AppMenu.userProfile).map((item) => HorizontalMenuItem(item: item, onTap: () {
            _onTap(context, item);
          })).toList()
          //+ [SignInButton(), BasketButton(scaffoldKey)],
      );
    } else {
      return Center(child: Image.asset('assets/logo/logo_molokovo.png'),);
    }
  }
}