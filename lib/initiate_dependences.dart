import 'package:get_it/get_it.dart';
import 'package:safe_come_home/providers/splash/splash_cubit.dart';
import 'package:safe_come_home/services/shared_preferences_service.dart';

final serviceLocator = GetIt.instance;

Future<void> initiateDependencies() async {
  serviceLocator.registerFactory(() => SharedPreferencesService());
  serviceLocator.registerLazySingleton(() => SplashCubit(serviceLocator()),);
}
