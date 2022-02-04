import 'package:get/get.dart';
import 'package:site_molokovo/models/product.dart';

class ProductDetailsController extends GetxController {
  final Product? product;

  ProductDetailsController(this.product);
  @override
  void onInit() {
    super.onInit();
    Get.log('ProductDetailsController created with id: ${product?.name}');
  }

  @override
  void onClose() {
    Get.log('ProductDetailsController close with id: ${product?.name}');
    super.onClose();
  }
}