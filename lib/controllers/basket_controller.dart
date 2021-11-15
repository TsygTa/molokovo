import 'package:get/get.dart';

class BasketController extends GetxController {

  int productsCounter = 0;

  @override
  void onInit() {

    super.onInit();
  }

  void incrementCounter() {
    productsCounter++;
    update();
  }

  void decrementCounter() {
    productsCounter--;
    update();
  }
}