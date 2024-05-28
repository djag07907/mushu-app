import 'package:flutter/material.dart';
import 'package:mushu_app/authentication/service/auth.dart';
import 'package:mushu_app/login/widgets/login_form.dart';
import 'package:mushu_app/resources/constants.dart';
import 'package:mushu_app/user/model/user_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          loginTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LoginForm(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text(
                registerTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
