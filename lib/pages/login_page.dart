import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleengineering/api/auth/auth_api.dart';
import 'package:simpleengineering/first_screen.dart';
import 'package:simpleengineering/main.dart';
import 'package:simpleengineering/model/user_cubit.dart';
import 'package:simpleengineering/model/user_models.dart';
import 'package:simpleengineering/pages/forget_pass.dart';
import 'package:simpleengineering/pages/home/home.dart';
import 'package:simpleengineering/there.dart';
import 'package:simpleengineering/widgets/fields.dart';
import 'package:simpleengineering/widgets/texxt_button.dart';

import 'register_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return HomeScreenUnauthorizedUser();
                  },
                ));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: const Text(
          'ProgressTracker',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 35,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(
            color: Colors.black,
            height: 2.0,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          SizedBox(
            height: 155,
          ),
          const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'e-mail',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 160, 160, 160),
                    width: 2.0,
                  ),
                ),
              
              
            ),
          ),
          SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Пароль',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 160, 160, 160),
                    width: 2.0,
                  ),
                ),
            ),
          ),
          SizedBox(height: 10),
          
          Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                  );
                },
                child: const Text(
                  'Забыли пароль?',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
          ),


          
          // Login
          Align(
  alignment: Alignment.bottomLeft,
  child: TextButton(
    onPressed: () async {
      var authRes = await userAuth(emailController.text, passwordController.text);
      if (authRes.runtimeType == String) {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Container(
                alignment: Alignment.center,
                height: 200,
                width: 250,
                decoration: BoxDecoration(),
                child: Text(authRes),
              ),
            );
          },
        );
      } else if (authRes.runtimeType == User) {
        User user = authRes;
        context.read<UserCubit>().emit(user);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ));
      }
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 25, 25, 230)),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 10, horizontal: 40)),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    child: const Text(
      'Войти',
      style: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  ),
),



          //
          Container(
            margin: EdgeInsets.only(
              top: 30,
              bottom: 74,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    "Don't have an account? Register now.",
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}