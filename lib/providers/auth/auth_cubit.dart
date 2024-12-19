import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_come_home/models/user.dart';
import 'package:safe_come_home/services/auth_remote_service.dart';
import 'package:safe_come_home/services/shared_preferences_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SharedPreferencesService _service;
  final AuthRemoteService _authRemoteService;
  AuthCubit(
      {required SharedPreferencesService service,
      required AuthRemoteService authRemoteService})
      : _service = service,
        _authRemoteService = authRemoteService,
        super(AuthInitial());
  void signUp(
      {required String name,
      required String email,
      required String password}) async {
    final response = await _authRemoteService.signUp(
        name: name, email: email, password: password);
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
        _service.setAuthenticationToken(r.token);
        emit(AuthSuccess(user: r));
      },
    );
  }
}
