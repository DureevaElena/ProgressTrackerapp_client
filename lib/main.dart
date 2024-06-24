import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:simpleengineering/api/auth/auth_api.dart';
import 'package:simpleengineering/constants.dart';
import 'package:simpleengineering/first_screen.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/home/home.dart';
import 'package:simpleengineering/pages/login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return UserCubit(User());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,     
        home: FutureBuilder<Box>(
            future: Hive.openBox(tokenBox),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var box = snapshot.data;
                var token = box!.get("token");
                if (token != null) {
                  return FutureBuilder<User?>(
                      future: getUser(token),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data != null) {
                            User user = snapshot.data!;
                            user.token = token;
                            context.read<UserCubit>().emit(user);
                            return const HomePage();
                          } else {
                            return const HomeScreenUnauthorizedUser();
                          }
                        } else {
                          return const HomeScreenUnauthorizedUser();
                        }
                      });
                } else {
                  return const HomeScreenUnauthorizedUser();
                }
              } else if (snapshot.hasError) {
                return const HomeScreenUnauthorizedUser();
              } else {
                return const HomeScreenUnauthorizedUser();
              }
            }),
      ),
    );
  }
}
