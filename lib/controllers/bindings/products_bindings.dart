import 'package:get/get.dart';
import 'package:site_molokovo/controllers/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsController>(
          () => ProductsController(),
    );
  }
}