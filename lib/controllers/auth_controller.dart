import 'package:get/get.dart';
import 'package:site_molokovo/models/user.dart';

class AuthController extends GetxController {

  User? user;

  @override
  void onInit() {

    super.onInit();
  }

  void setUser(User user) {
    this.user = user;
    update();
  }
}