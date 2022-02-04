import 'package:get/get.dart';
import 'package:site_molokovo/constants/app_menu.dart';
import 'package:site_molokovo/models/auth_response.dart';
import 'package:site_molokovo/models/user.dart';
import 'package:site_molokovo/repositories/data_repository.dart';
import 'package:site_molokovo/services/auth_service.dart';

enum AuthState{notAuth, init, codeSent, codeSentFailed, success, failed}

class AuthController extends GetxController {

  final DataRepository _dataRepository = DataRepository.instance;

  User? user;

  AuthState authState = AuthState.notAuth;


  void notAuth() {
    authState = AuthState.notAuth;
    user = null;
    update();
  }

  void authInit() {
    authState = AuthState.init;
    user = null;
    update();
  }

  void sendCode(phone) async {
    if(phone != null) {
      bool result = await _dataRepository.sendCode(phone!);
      if(result) {
        authState = AuthState.codeSent;
      } else {
        authState = AuthState.codeSentFailed;
      }
      update();
    }
  }

  void checkCode({required String phone, required String code}) async {
    AuthResponse response = await _dataRepository.auth(phone, code);
    if(response.status && response.user != null) {
      user = response.user;
      AuthService.to.login();
      authState = AuthState.success;
    } else {
      authState = AuthState.failed;
    }
    update();
  }

  void changeUserName(String value) {
    if(user == null) return;
    user!.copyWith(name: value);
    _dataRepository.saveUser(user!);
    update();
  }

  void changeUserEmail(String value) {
    if(user == null) return;
    user!.copyWith(email: value);
    _dataRepository.saveUser(user!);
    update();
  }

  void changeUserAddress(String value) {
    if(user == null) return;
    user!.copyWith(address: value);
    _dataRepository.saveUser(user!);
    update();
  }

  void logout() {
    Get.rootDelegate.toNamed(AppMenu.home.route);
    AuthService.to.logout();
    authState = AuthState.notAuth;
    user = null;
    update();
  }
}