import 'package:flutter/material.dart';
import 'package:fluttertest/app/views/auth/forgot_password/forgot_password_page.dart';
import 'package:fluttertest/app/views/auth/register/register_page.dart';
import 'package:fluttertest/app/views/auth/verify_email/verify_email_page.dart';
import 'package:fluttertest/app/views/home/home_page.dart';
import 'package:fluttertest/app/views/profile_update/profile_update_page.dart';
import 'package:fluttertest/app/views/splash/splash_page.dart';

import '../../views/auth/login/login_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterPage());

      case '/verify-email':
        return MaterialPageRoute(builder: (_) => const VerifyEmailPage());
      case '/forgot-password':
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());

      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());

      case '/profile-update':
        return MaterialPageRoute(builder: (_) => const ProfileUpdatePage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Page Not Found!'),
        ),
        body: const Center(
          child: Text(
            'Error 404',
          ),
        ),
      ),
    );
  }
}
