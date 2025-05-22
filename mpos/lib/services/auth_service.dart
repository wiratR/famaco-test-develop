import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../config/config.dart';

class AuthService {
  Future<bool> login(UserModel user) async {
    final url = Uri.parse('${AppConfig.baseUrl}${AppConfig.loginEndpoint}');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(user.toJson());

    if (kDebugMode) {
      debugPrint('🔐 Login Request:');
      debugPrint('POST $url');
      debugPrint('Headers: $headers');
      debugPrint('Body: $body');
    }

    final response = await http.post(url, headers: headers, body: body);

    if (kDebugMode) {
      debugPrint('Response Status: ${response.statusCode}');
      debugPrint('Response Body: ${response.body}');
    }

    return response.statusCode == 200;
  }

  Future<bool> loginByPhone(UserModel user) async {
    final url = Uri.parse('${AppConfig.baseUrl}/auth/loginbyphone');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'phone': user.phone, 'password': user.password});

    if (kDebugMode) {
      debugPrint('🔐 LoginByPhone Request:');
      debugPrint('POST $url');
      debugPrint('Headers: $headers');
      debugPrint('Body: $body');
    }

    final response = await http.post(url, headers: headers, body: body);

    if (kDebugMode) {
      debugPrint('Response Status: ${response.statusCode}');
      debugPrint('Response Body: ${response.body}');
    }

    return response.statusCode == 200;
  }

  Future<bool> register(UserModel user) async {
    final response = await http.post(
      Uri.parse('${AppConfig.baseUrl}/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    debugPrint('📝 Register Request:');
    debugPrint('POST ${AppConfig.baseUrl}/auth/register');
    debugPrint('Headers: ${response.request?.headers}');
    debugPrint('Body: ${jsonEncode(user.toJson())}');
    debugPrint('Response Status: ${response.statusCode}');
    debugPrint('Response Body: ${response.body}');

    // Accept 200 or 201 as success
    return response.statusCode == 200 || response.statusCode == 201;
  }
}
