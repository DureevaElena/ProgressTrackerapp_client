import 'package:flutter/material.dart';

class HomeScreenUnauthorizedUser extends StatelessWidget {
  const HomeScreenUnauthorizedUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: Padding(padding: EdgeInsets.all(10), 
        child: Image.asset('assets/logo.png', height: 70,),
        ), 
        leadingWidth: 90,
        title: const Text('ProgressTracker', 
        style: TextStyle(
          fontFamily: 'Montserrat', 
          fontSize: 35,
          color: Colors.black)
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0), // Высота линии
          child: Container(
            color: Colors.black, // Цвет линии
            height: 2.0, // Высота линии
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Только авторизированный пользователь может добавить цель',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/AuthorizationFormScreen');
              },
              child: const Text(
                'Войти',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 150),
            const Text(
              'Если нет аккаунта',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/RegistrationFormScreen');
              },
              child: const Text(
                'Зарегистрироваться',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}