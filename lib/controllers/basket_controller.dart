import 'package:get/get.dart';
import 'package:site_molokovo/constants/app_menu.dart';
import 'package:site_molokovo/models/basket_item.dart';
import 'package:site_molokovo/models/product.dart';
import 'package:collection/collection.dart';
import 'package:site_molokovo/routes/app_pages.dart';
import 'package:site_molokovo/utils/extensions.dart';

enum PaymentType{byCartOnSite, byCashToCourier}

class BasketController extends GetxController {

  List<BasketItem> items = [];
  PaymentType paymentType = PaymentType.byCartOnSite;

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

  void gotoProducts() {
    Get.back();
    Get.rootDelegate.toNamed(AppMenu.products.route);
  }

  void makeOrder() {
    Get.back();
    Get.rootDelegate.toNamed(AppPages.order);
  }

  void makePayment() {
    Get.appDialog('payment'.tr, 'payment_success'.tr);
    Get.rootDelegate.toNamed((AppMenu.products.route));
  }

  void setPaymentType(PaymentType type) {
    paymentType = type;
    update();
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