import 'package:safe_come_home/models/user.dart';

abstract interface class AuthRemoteRepository {
  Future<User> signUp({
    required String name,
    required String email,
    required String password,
    required int gender,
    required String birthday,
  });

  Future<User> signIn({
    required String email,
    required String password,
  });

  Future<bool> validateToken();
}
