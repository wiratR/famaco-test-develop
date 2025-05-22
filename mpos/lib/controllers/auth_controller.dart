import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthController {
  final AuthService _authService = AuthService();

  Future<bool> login(UserModel user) async {
    return await _authService.login(user);
  }

  Future<bool> loginByPhone(UserModel user) async {
    return await _authService.loginByPhone(user);
  }

  Future<bool> register(UserModel user) async {
    return await _authService.register(user);
  }
}
