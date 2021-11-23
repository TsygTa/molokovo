import 'package:site_molokovo/models/user.dart';

class SaveUserResponse {
  SaveUserResponse({required this.status, this.error});
  final bool status;
  final String? error;
}