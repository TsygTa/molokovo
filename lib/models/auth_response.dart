import 'package:site_molokovo/models/user.dart';

class AuthResponse {
  AuthResponse({required this.status, this.user, this.error});
  final bool status;
  final String? error;
  final User? user;
}