import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';
  static String get loginEndpoint => dotenv.env['LOGIN_ENDPOINT'] ?? '/login';
  static String get registerEndpoint =>
      dotenv.env['REGISTER_ENDPOINT'] ?? '/register';
  static String get environment => dotenv.env['APP_ENV'] ?? 'production';
  static bool get isDebug => dotenv.env['DEBUG'] == 'true';
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
}
