
import 'package:get/get.dart';
import 'package:site_molokovo/constants/app_menu.dart';
import 'package:site_molokovo/models/app_route_path.dart';

class AppPagesController extends GetxController {

  AppRoutePath currentPage = AppMenu.home;

  void setPage(AppMenu item) {
    currentPage = item;
    update();
  }
}