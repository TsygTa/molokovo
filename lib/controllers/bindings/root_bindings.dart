import 'package:get/get.dart';
import 'package:site_molokovo/controllers/auth_controller.dart';
import 'package:site_molokovo/controllers/basket_controller.dart';
import 'package:site_molokovo/controllers/menu_pages_controllers.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
          () => AuthController(),
    );
    Get.lazyPut<BasketController>(
          () => BasketController(),
    );
    Get.lazyPut<MenuPagesController>(
          () => MenuPagesController(),
    );
  }
}