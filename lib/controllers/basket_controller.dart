import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/app_route.dart';
import 'package:site_molokovo/models/basket_item.dart';
import 'package:site_molokovo/models/product.dart';
import 'package:collection/collection.dart';

import 'app_pages_controllers.dart';

class BasketController extends GetxController {

  List<BasketItem> items = [];

  void addProduct(Product product) {
    BasketItem? item = items.firstWhereOrNull((element) => element.product.name == product.name);
    if(item == null) {
      items.add(BasketItem(product));
    } else {
      items[items.indexOf(item)].quantity ++;
    }
    update();
  }

  void deleteProduct(product) {
    BasketItem? item = items.firstWhereOrNull((element) => element.product.name == product.name);
    if(item != null) {
      if(item.quantity <= 1) {
        items.removeAt(items.indexOf(item));
      } else {
        items[items.indexOf(item)].quantity --;
      }
      update();
    }
  }

  void gotoProducts(BuildContext context) {
    Navigator.pop(context);
    AppPagesController _pagesController = Get.find();
    _pagesController.setPage(AppRoute.products);
  }

  void makeOrder(BuildContext context) {
    Navigator.pop(context);
    AppPagesController _pagesController = Get.find();
    _pagesController.setPage(AppRoute.products);
  }

  bool get basketIsEmpty {
    return items.isEmpty;
  }

  String get total {
    if(basketIsEmpty) return '0.0';
    return items.map((e) => e.product.price * e.quantity).reduce((a, b) => a+b).toStringAsFixed(0);
  }

  String get productsNumber {
    if(basketIsEmpty) return '0';
    return items.map((e) => e.quantity).reduce((a, b) => a+b).toString();
  }
}