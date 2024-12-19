import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_come_home/constants/routers.dart';
import 'package:safe_come_home/initiate_dependences.dart';
import 'package:safe_come_home/pages/splash/splash_page.dart';
import 'package:safe_come_home/providers/splash/splash_cubit.dart';

import 'constants/pallet.dart';
import 'constants/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initiateDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => serviceLocator<SplashCubit>()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe Come Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(27),
          border: AppTheme.border(),
          enabledBorder: AppTheme.border(),
          focusedBorder: AppTheme.border(AppPallet.buttonBackgroundColor),
          errorBorder: AppTheme.border(AppPallet.buttonBackgroundColor),
        ),
      ),
      onGenerateRoute: AppRouter().onGenerateRoute,
      home: const SplashPage(),
    );
  }
}
