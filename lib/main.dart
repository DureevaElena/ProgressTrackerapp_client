import 'package:flutter/material.dart';
import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:progresstrackerapp/Pages/Admin/admin_community_goals_screen.dart';
import 'package:progresstrackerapp/Pages/Admin/admin_personal_information_screen.dart';
import 'package:progresstrackerapp/Pages/Admin/admin_users_screen.dart';
import 'package:progresstrackerapp/Pages/UnauthorizationUser/authorization_form_screen.dart';
import 'package:progresstrackerapp/Pages/UnauthorizationUser/change_password_screen.dart';
import 'package:progresstrackerapp/Pages/AuthorizationUser/Community/community_home_authorized_user_screen.dart';
import 'package:progresstrackerapp/Pages/AuthorizationUser/Personalinformation/GoalsStatus/completed_goals_screen.dart';
import 'package:progresstrackerapp/Pages/AuthorizationUser/Individual/Goals/create_goal_screen.dart';
import 'package:progresstrackerapp/Pages/AuthorizationUser/Individual/GoalsStages/create_goal_stages_screen.dart';
import 'package:progresstrackerapp/Pages/AuthorizationUser/Personalinformation/GoalsStatus/current_goals_screen.dart';
import 'package:progresstrackerapp/Pages/AuthorizationUser/Individual/Goals/edit_goal_screen.dart';
import 'package:progresstrackerapp/Pages/AuthorizationUser/Individual/GoalsStages/edit_goal_stages_screen.dart';
import 'package:progresstrackerapp/Pages/AuthorizationUser/Personalinformation/edit_profile_screen.dart';
import 'package:progresstrackerapp/Pages/AuthorizationUser/Personalinformation/GoalsStatus/expired_goals_screen.dart';
import 'package:progresstrackerapp/Pages/UnauthorizationUser/home_screen_unauthorized_user.dart';
import 'package:progresstrackerapp/Pages/AuthorizationUser/Individual/individual_home_authorized_user_screen.dart';
import 'package:progresstrackerapp/Pages/UnauthorizationUser/loading_app_screen.dart';
import 'package:progresstrackerapp/Pages/UnauthorizationUser/password_recovery_screen.dart';
import 'package:progresstrackerapp/Pages/AuthorizationUser/Personalinformation/personal_information_user_screen.dart';
import 'package:progresstrackerapp/Pages/UnauthorizationUser/registration_form_screen.dart';
import 'package:progresstrackerapp/Pages/UnauthorizationUser/verification_code_screen.dart';
import 'package:progresstrackerapp/Pages/AuthorizationUser/Community/Goals/view_community_goal_screen.dart';
import 'package:progresstrackerapp/Pages/AuthorizationUser/Community/GoalsStages/view_community_goal_stages_screen.dart';
import 'package:progresstrackerapp/Pages/AuthorizationUser/Individual/GoalsStages/view_goal_stages_screen.dart';
import 'package:progresstrackerapp/Pages/AuthorizationUser/Individual/Goals/viewing_created_goal_screen.dart';
//a8505c65-9f2b-4a0e-910e-dd3d062a8226

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppMetrica.activate(AppMetricaConfig("a8505c65-9f2b-4a0e-910e-dd3d062a8226"));
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(166, 51, 51, 0.027),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255,249,249,249),
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
        '/IndividualHomeScreenAuthorizedUser':(context) =>  IndividualHomeScreenAuthorizedUser(),
        '/PersonalInformationUserScreen':(context) => const PersonalInformationUserScreen(),
        '/EditProfileScreen':(context) => const EditProfileScreen(),
        '/CompletedGoalsScreen':(context) => const CompletedGoalsScreen(),
        '/ExpiredGoalsScreen':(context) => const ExpiredGoalsScreen(),
        '/CreateGoalScreen':(context) =>  CreateGoalScreen(),
        '/ViewingCreatedGoalScreen':(context) => ViewingCreatedGoalScreen(),
        '/EditGoalScreen':(context) => const EditGoalScreen(),
        '/ViewGoalStagesScreen':(context) => const ViewGoalStagesScreen(),
        '/CreateGoalStagesScreen':(context) => const CreateGoalStagesScreen(), 
        '/EditGoalStagesScreen':(context) => const EditGoalStagesScreen(),
        '/CommunityHomeScreenAuthorizedUser':(context) => const CommunityHomeScreenAuthorizedUser(),
        '/ViewCommunityGoalScreen':(context) => const ViewCommunityGoalScreen(),  
        '/ViewCommunityGoalStagesScreen':(context) => const ViewCommunityGoalStagesScreen(),    
        '/CurrentGoalsScreen':(context) => const CurrentGoalsScreen(),   
        '/AdminUsersScreen':(context) => const AdminUsersScreen(),
        '/AdminPersonalInformationScreen':(context) => const AdminPersonalInformationScreen(),
        '/AdminCommunityDoalsScreen':(context) => const AdminCommunityDoalsScreen(),
      },
    );
  }
}