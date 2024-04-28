import 'package:flutter/material.dart';
import 'package:progresstrackerapp/authorization_form_screen.dart';
import 'package:progresstrackerapp/change_password_screen.dart';
import 'package:progresstrackerapp/home_screen_unauthorized_user.dart';
import 'package:progresstrackerapp/loading_app_screen.dart';
import 'package:progresstrackerapp/password_recovery_screen.dart';
import 'package:progresstrackerapp/registration_form_screen.dart';
import 'package:progresstrackerapp/verification_code_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Named Routes',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.pink,
        ),
        scaffoldBackgroundColor: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingAppScreen(),
        '/HomeScreenUnauthorizedUser': (context) => const HomeScreenUnauthorizedUser(),
        '/AuthorizationFormScreen':(context) => const AuthorizationFormScreen(),
        '/PasswordRecoveryFormScreen':(context) => const PasswordRecoveryFormScreen(),
        '/RegistrationFormScreen':(context) => const RegistrationFormScreen(),
        '/VerificationCodeFormScreen':(context) => const VerificationCodeFormScreen(),
        '/ChangePasswordFormScreen':(context) => const ChangePasswordFormScreen(),


      },
    );
  }
}