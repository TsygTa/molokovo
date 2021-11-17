import 'package:get/get.dart';
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
}