import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simpleengineering/api/note/note_api.dart';
import 'package:simpleengineering/api/note/user_api.dart';
import 'dart:convert';

import 'package:simpleengineering/model/note_model.dart';

const String baseUrl = "http://10.0.2.2:8000"; 
class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  Password? _password;

  Future<void> _requestPasswordReset() async {
    Password? password = await requestPasswordReset(_emailController.text);
    if (password != null) {
      setState(() {
        _password = password;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to request password reset')),
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
            if (_password != null) ...[
              SizedBox(height: 20),
              Text('Password Reset Details:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(_password.toString()),
            ],
          ],
        ),
      ),
    );
  }
}
