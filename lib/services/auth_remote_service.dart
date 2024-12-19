import 'package:fpdart/fpdart.dart';
import 'package:safe_come_home/error/failure.dart';
import 'package:safe_come_home/models/user.dart';

abstract interface class AuthRemoteService {
  Future<Either<Failure, User>> signUp(
      {required String name, required String email, required String password});

  Future<Either<Failure, User>> signIn(
      {required String email, required String password});
}
