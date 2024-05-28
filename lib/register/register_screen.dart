import 'package:flutter/material.dart';
import 'package:mushu_app/authentication/service/auth.dart';
import 'package:mushu_app/register/widgets/register_form.dart';
import 'package:mushu_app/user/model/user_model.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RegisterForm(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                'To login screen',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
