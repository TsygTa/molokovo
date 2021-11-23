import 'package:get/get.dart';
import 'package:site_molokovo/models/auth_response.dart';
import 'package:site_molokovo/models/product.dart';
import 'package:site_molokovo/models/user.dart';
import 'package:site_molokovo/repositories/data_repository.dart';

class ProductsController extends GetxController {

  final DataRepository _dataRepository = DataRepository.instance;
  List<Product> products = [];

  @override
  void onInit() {
    products.addAll(_dataRepository.getProducts);
    super.onInit();
  }
}