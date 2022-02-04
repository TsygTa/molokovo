import 'package:get/get.dart';
import 'package:site_molokovo/controllers/auth_controller.dart';
import 'package:site_molokovo/controllers/basket_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(),);
    Get.put<BasketController>(BasketController(),);
  }
}