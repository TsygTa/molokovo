import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:site_molokovo/controllers/product_details_controller.dart';
import 'package:site_molokovo/repositories/data_repository.dart';

class ProductDetailsBinding extends Bindings {
  final DataRepository _dataRepository = DataRepository.instance;
  @override
  void dependencies() {
    Get.create<ProductDetailsController>(
      () => ProductDetailsController(_dataRepository.getProducts.firstWhereOrNull((element) => element.id == Get.parameters['productId'])),
    );
  }
}