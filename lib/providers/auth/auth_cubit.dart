import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_come_home/models/user.dart';
import 'package:safe_come_home/services/auth_remote_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRemoteService _authRemoteService;
  AuthCubit({required AuthRemoteService authRemoteService})
      : _authRemoteService = authRemoteService,
        super(AuthInitial());
  void signUp(
      {required String name,
      required String birthday,
      required int gender,
      required String email,
      required String password}) async {
    final response = await _authRemoteService.signUp(
        name: name,
        email: email,
        password: password,
        gender: gender,
        birthday: birthday);
    response.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (r) => emit(AuthSuccess(user: r)),
    );
  }

  void signIn({required String email, required String password}) async {
    final response =
        await _authRemoteService.signIn(email: email, password: password);
    response.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (r) {
        emit(AuthSuccess(user: r));
      },
    );
  }

  void validateToken() async {
    try {
      emit(AuthLoading());
      final response = await _authRemoteService.validateToken();
      response.fold(
        (l) => emit(AuthFailure(message: l.message)),
        (r) => emit(AuthSignIn(signIn: r)),
      );
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }
}
