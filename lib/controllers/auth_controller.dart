import 'package:get/get.dart';
import 'package:site_molokovo/constants/app_route.dart';
import 'package:site_molokovo/controllers/app_pages_controllers.dart';
import 'package:site_molokovo/models/auth_response.dart';
import 'package:site_molokovo/models/user.dart';
import 'package:site_molokovo/repositories/data_repository.dart';

enum AuthState{init, codeSent, codeSentFailed, success, failed}

class AuthController extends GetxController {

  final DataRepository _dataRepository = DataRepository.instance;

  User? user;

  AuthState authState = AuthState.init;

  @override
  void onReady() {
    authState = AuthState.init;
    super.onReady();
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
      authState = AuthState.success;
    } else {
      authState = AuthState.failed;
    }
    update();
  }

  void changeUserName(String value) {
    if(user == null) return;
    user = user!.copyWith(name: value);
    _dataRepository.saveUser(user!);
    update();
  }

  void changeUserEmail(String value) {
    if(user == null) return;
    user = user!.copyWith(email: value);
    _dataRepository.saveUser(user!);
    update();
  }

  void changeUserAddress(String value) {
    if(user == null) return;
    user = user!.copyWith(address: value);
    _dataRepository.saveUser(user!);
    update();
  }

  void logout() {
    AppPagesController _pagesController = Get.find();
    _pagesController.setPage(AppRoute.home);
    authState = AuthState.init;
    user = null;
    update();
  }
}