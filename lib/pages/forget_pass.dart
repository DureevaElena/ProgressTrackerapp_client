import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'change_password.dart'; // Импортируем страницу с изменением пароля

const String baseUrl = "http://10.0.2.2:8000"; // Обратите внимание на базовый URL

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> _requestPasswordReset() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/request-password-reset/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': _emailController.text,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        String encodedPk = responseData['encoded_pk'];
        String token = responseData['token'];
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangePasswordPage(encodedPk: encodedPk, token: token),
          ),
        );
      } else {
        final responseData = jsonDecode(response.body);
        if (responseData.containsKey('message')) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(responseData['message'])),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Unexpected error occurred')),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Password Reset'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _requestPasswordReset,
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
