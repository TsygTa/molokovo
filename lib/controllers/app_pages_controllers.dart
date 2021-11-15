import 'package:get/get.dart';
import 'package:site_molokovo/constants/app_route.dart';

class AppPagesController extends GetxController {

  AppRoute currentPage = AppRoute.home;

  @override
  void onInit() {

    super.onInit();
  }

  void setPage(AppRoute item) {
    currentPage = item;
    update();
  }
}