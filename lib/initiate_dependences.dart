import 'package:get_it/get_it.dart';
import 'package:safe_come_home/providers/auth/auth_cubit.dart';
import 'package:safe_come_home/providers/splash/splash_cubit.dart';
import 'package:safe_come_home/repositories/auth_remote_repository.dart';
import 'package:safe_come_home/repositories/impl/auth_remote_repository_impl.dart';
import 'package:safe_come_home/services/auth_remote_service.dart';
import 'package:safe_come_home/services/impl/auth_remote_service_impl.dart';
import 'package:safe_come_home/services/shared_preferences_service.dart';

final serviceLocator = GetIt.instance;

Future<void> initiateDependencies() async {
  _initAuth();
  serviceLocator.registerFactory(() => SharedPreferencesService());
  serviceLocator.registerLazySingleton(
    () => SplashCubit(serviceLocator()),
  );
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteRepository>(
      () => AuthRemoteRepositoryImpl(
        service: serviceLocator(),
      ),
    )
    ..registerFactory<AuthRemoteService>(
      () => AuthRemoteServiceImpl(
        authRemoteRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AuthCubit(
        authRemoteService: serviceLocator(),
      ),
    );
}
