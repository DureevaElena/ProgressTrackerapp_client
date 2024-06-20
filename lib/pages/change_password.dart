import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseUrl = "http://10.0.2.2:8000"; // ваш базовый URL

class ChangePasswordPage extends StatefulWidget {
  final String encodedPk;
  final String token;

  ChangePasswordPage({required this.encodedPk, required this.token});

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _changePassword() async {
    try {
      var url = Uri.parse('$baseUrl/password-reset/${widget.encodedPk}/${widget.token}/');
      var response = await http.patch(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Пароль успешно изменен')),
        );
        Navigator.pop(context); // Вернуться на предыдущий экран
      } else {
        final responseData = jsonDecode(response.body);
        if (responseData.containsKey('message')) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(responseData['message'])),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Произошла непредвиденная ошибка')),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Изменение пароля'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Новый пароль'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changePassword,
              child: Text('Изменить пароль'),
            ),
          ],
        ),
      ),
    );
  }
}
