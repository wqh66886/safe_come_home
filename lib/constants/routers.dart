import 'package:flutter/material.dart';
import 'package:safe_come_home/pages/404.dart';
import 'package:safe_come_home/pages/home/home_page.dart';
import 'package:safe_come_home/pages/sign_in/sign_in_page.dart';
import 'package:safe_come_home/pages/sign_up/sign_up_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/signup":
        return MaterialPageRoute(
          builder: (_) => const SignUpPage(),
        );
      case "/login":
        return MaterialPageRoute(
          builder: (_) => const SignInPage(),
        );
      case "/home":
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
    }
  }
}
