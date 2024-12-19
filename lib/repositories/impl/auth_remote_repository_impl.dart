import 'dart:convert';

import 'package:safe_come_home/constants/constant.dart';
import 'package:safe_come_home/error/exception.dart';
import 'package:safe_come_home/models/user.dart';
import 'package:safe_come_home/repositories/auth_remote_repository.dart';
import 'package:http/http.dart' as http;

class AuthRemoteRepositoryImpl implements AuthRemoteRepository {
  @override
  Future<User> signIn({required String email, required String password}) async {
    try {
      final response = await http.post(Uri.parse("${Constants.baseUrl}/login"),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({}));
      if (response.statusCode != 200) {
        throw ServiceException(jsonDecode(response.body)["message"]);
      }
      return User.fromMap(jsonDecode(response.body)["data"]);
    } catch (e) {
      throw ServiceException(e.toString());
    }
  }

  @override
  Future<User> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await http.post(Uri.parse("${Constants.baseUrl}/signup"),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({}));
      if (response.statusCode != 200) {
        throw ServiceException(jsonDecode(response.body)["message"]);
      }
      return User.fromMap(jsonDecode(response.body)["data"]);
    } catch (e) {
      throw ServiceException(e.toString());
    }
  }
}
