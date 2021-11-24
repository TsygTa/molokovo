import 'package:get/get.dart';
import 'package:site_molokovo/models/product.dart';

class BasketItem {
  BasketItem(this.product);
  final Product product;
  int quantity = 1;

  double get total {
    return product.price * quantity;
  }

  String get totalToString {
    return total.toStringAsFixed(0) + ' ' + 'rub'.tr;
  }
}