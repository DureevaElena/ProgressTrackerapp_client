import 'package:flutter/material.dart';
import 'package:progresstrackerapp/authorization_form_screen.dart';
import 'package:progresstrackerapp/change_password_screen.dart';
import 'package:progresstrackerapp/create_goal_screen.dart';
import 'package:progresstrackerapp/create_goal_stages_screen.dart';
import 'package:progresstrackerapp/current_goals_screen.dart';
import 'package:progresstrackerapp/edit_goal_screen.dart';
import 'package:progresstrackerapp/edit_profile_screen.dart';
import 'package:progresstrackerapp/expired_goals_screen.dart';
import 'package:progresstrackerapp/home_screen_unauthorized_user.dart';
import 'package:progresstrackerapp/individual_home_authorized_user_screen.dart';
import 'package:progresstrackerapp/loading_app_screen.dart';
import 'package:progresstrackerapp/password_recovery_screen.dart';
import 'package:progresstrackerapp/personal_information_user_screen.dart';
import 'package:progresstrackerapp/registration_form_screen.dart';
import 'package:progresstrackerapp/verification_code_screen.dart';
import 'package:progresstrackerapp/view_goal_stages_screen.dart';
import 'package:progresstrackerapp/viewing_created_goal_screen.dart';

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
        '/IndividualHomeScreenAuthorizedUser':(context) => const IndividualHomeScreenAuthorizedUser(),
        '/PersonalInformationUserScreen':(context) => const PersonalInformationUserScreen(),
        '/EditProfileScreen':(context) => const EditProfileScreen(),
        '/CurrentGoalsScreen':(context) => const CurrentGoalsScreen(),
        '/ExpiredGoalsScreen':(context) => const ExpiredGoalsScreen(),
        '/CurrentGoalsScreen':(context) => const CurrentGoalsScreen(),
        '/CreateGoalScreen':(context) => const CreateGoalScreen(),
        '/ViewingCreatedGoalScreen':(context) => const ViewingCreatedGoalScreen(),
        '/EditGoalScreen':(context) => const EditGoalScreen(),
        '/ViewGoalStagesScreen':(context) => const ViewGoalStagesScreen(),
        '/CreateGoalStagesScreen':(context) => const CreateGoalStagesScreen(),           


      },
    );
  }
}