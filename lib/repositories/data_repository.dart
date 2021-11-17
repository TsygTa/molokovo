import 'package:get/get.dart';

import 'package:site_molokovo/models/auth_response.dart';
import 'package:site_molokovo/models/user.dart';

class DataRepository {

  DataRepository._();
  static final DataRepository _instance = DataRepository._();

  static DataRepository get instance {
    return _instance;
  }

  static const testCode = '7777';

  String? _phone;

  Future<bool> sendCode(String phone) async {
    _phone = phone;

    return true;
  }

  Future<AuthResponse> auth(String phone, String code) async {
    if(_phone == phone && code == testCode) {
      return AuthResponse(status: true, user: User(phone: phone));
    } else {
      return AuthResponse(status: false, error: 'auth_failed'.tr);
    }
  }

}