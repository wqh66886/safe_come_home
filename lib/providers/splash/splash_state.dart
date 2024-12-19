part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashLoading extends SplashState {}

final class SplashLoadSuccess extends SplashState {
  final bool isFirstOpen;

  SplashLoadSuccess({required this.isFirstOpen});
}

final class SplashLoadFailure extends SplashState {
  final String message;

  SplashLoadFailure({required this.message});
}
