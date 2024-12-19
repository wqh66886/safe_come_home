import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_come_home/services/shared_preferences_service.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SharedPreferencesService sharedPreferencesService;
  SplashCubit(this.sharedPreferencesService) : super(SplashInitial());

  void isFirstOpen() async {
    emit(SplashLoading());
    try {
      bool isFirstOpen = await sharedPreferencesService.isFirstOpen();
      emit(SplashLoadSuccess(isFirstOpen: isFirstOpen));
    } catch (e) {
      emit(SplashLoadFailure(message: e.toString()));
    }
  }

  void appIsOpen() async {
    try {
      emit(SplashLoading());
      await sharedPreferencesService.appIsOpen();
      bool isFirstOpen = await sharedPreferencesService.isFirstOpen();
      if (isFirstOpen) {
        emit(SplashLoadSuccess(isFirstOpen: isFirstOpen));
      }
    } catch (e) {
      emit(SplashLoadFailure(message: e.toString()));
    }
  }
}
