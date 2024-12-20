import 'package:fpdart/fpdart.dart';
import 'package:safe_come_home/error/failure.dart';
import 'package:safe_come_home/models/user.dart';
import 'package:safe_come_home/repositories/auth_remote_repository.dart';
import 'package:safe_come_home/services/auth_remote_service.dart';

class AuthRemoteServiceImpl implements AuthRemoteService {
  final AuthRemoteRepository authRemoteRepository;

  AuthRemoteServiceImpl({required this.authRemoteRepository});
  @override
  Future<Either<Failure, User>> signIn(
      {required String email, required String password}) async {
    try {
      final user =
          await authRemoteRepository.signIn(email: email, password: password);
      return right(user);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signUp({
    required String name,
    required String email,
    required String password,
    required String birthday,
    required int gender,
  }) async {
    try {
      final user = await authRemoteRepository.signUp(
        name: name,
        email: email,
        password: password,
        gender: gender,
        birthday: birthday,
      );
      return right(user);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> validateToken() async {
    try {
      final response = await authRemoteRepository.validateToken();
      return right(response);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
