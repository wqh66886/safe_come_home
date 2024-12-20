import 'dart:convert';

import 'package:safe_come_home/constants/api.dart';
import 'package:safe_come_home/constants/constant.dart';
import 'package:safe_come_home/error/exception.dart';
import 'package:safe_come_home/models/user.dart';
import 'package:safe_come_home/repositories/auth_remote_repository.dart';
import 'package:http/http.dart' as http;
import 'package:safe_come_home/services/shared_preferences_service.dart';

class AuthRemoteRepositoryImpl implements AuthRemoteRepository {
  final SharedPreferencesService _service;

  AuthRemoteRepositoryImpl({required SharedPreferencesService service})
      : _service = service;
  @override
  Future<User> signIn({required String email, required String password}) async {
    try {
      final response =
          await http.post(Uri.parse("${Constants.baseUrl}${Api.signIn}"),
              headers: {
                "Content-Type": "application/json",
              },
              body: jsonEncode({
                "email": email,
                "password": password,
              }));
      if (response.statusCode != 200) {
        throw ServiceException(jsonDecode(response.body)["message"]);
      }
      final map = jsonDecode(response.body)["data"];
      _service.setAuthenticationToken(map["token"]);
      return User.fromConsumeMap(map["user"]).copyWith(token: map["token"]);
    } on ServiceException catch (e) {
      throw e.message;
    }
  }

  @override
  Future<User> signUp({
    required String name,
    required String email,
    required String password,
    required int gender,
    required String birthday,
  }) async {
    try {
      final response =
          await http.post(Uri.parse("${Constants.baseUrl}${Api.signUp}"),
              headers: {
                "Content-Type": "application/json",
              },
              body: jsonEncode({
                "name": name,
                "email": email,
                "password": password,
                "gender": gender,
                "birthday": birthday,
              }));
      if (response.statusCode != 200) {
        throw ServiceException(jsonDecode(response.body)["message"]);
      }
      return User.fromMap(jsonDecode(response.body)["data"]);
    } on ServiceException catch (e) {
      throw e.message;
    }
  }

  @override
  Future<bool> validateToken() async {
    try {
      final token = await _service.getAuthorizationToken();
      if (token.isEmpty) {
        return false;
      }
      final response = await http.get(
        Uri.parse("${Constants.baseUrl}${Api.validate}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": token,
        },
      );
      if (response.statusCode != 200) {
        throw ServiceException(jsonDecode(response.body)["message"]);
      }
      return jsonDecode(response.body)["data"];
    } on ServiceException catch (e) {
      throw e.message;
    }
  }
}
