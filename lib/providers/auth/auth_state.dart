part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadig extends AuthState {}

final class AuthSuccess extends AuthState {
  final User user;

  AuthSuccess({required this.user});
}

final class AuthFailure extends AuthState {
  final String message;

  AuthFailure({required this.message});
}
