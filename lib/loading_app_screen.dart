import 'package:flutter/material.dart';

class LoadingAppScreen extends StatelessWidget {
  const LoadingAppScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/HomeScreenUnauthorizedUser');
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: Center(
        child: Image.asset('assets/logo.png', width: 200, height: 200)
      ),
    );
  }
}