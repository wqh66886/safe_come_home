import 'package:safe_come_home/models/user.dart';

abstract interface class AuthRemoteRepository {
  Future<User> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<User> signIn({
    required String email,
    required String password,
  });
}
