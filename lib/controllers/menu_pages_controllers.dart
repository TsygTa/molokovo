
import 'package:get/get.dart';
import 'package:site_molokovo/constants/app_menu.dart';

class MenuPagesController extends GetxController {

  AppMenu currentPage = AppMenu.home;

  void setPage(AppMenu item) {
    currentPage = item;
    update();
  }
}