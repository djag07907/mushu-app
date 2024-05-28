import 'package:flutter/material.dart';
import 'package:mushu_app/authentication/service/auth.dart';
import 'package:mushu_app/resources/constants.dart';
import 'package:mushu_app/resources/styles.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final Auth auth = Auth();
    final formKey = GlobalKey<FormState>();
    String errorMessage = '';

    String email = '';
    String password = '';

    return Expanded(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (errorMessage.isNotEmpty)
                  Text(
                    errorMessage,
                    style: const TextStyle(
                      color: errorColor,
                    ),
                  ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: emailLabel,
                  ),
                  validator: (value) => value!.isEmpty || !value.contains('@')
                      ? invalidEmail
                      : null,
                  onSaved: (value) => email = value!,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: passwordLabel,
                  ),
                  validator: (value) =>
                      value!.isEmpty || value.length < 7 ? weakPassword : null,
                  onSaved: (value) => password = value!,
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      String? uid = await auth.signInWithEmailAndPassword(
                          email, password);
                      if (uid != null) {
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        setState(() {
                          errorMessage = incorrectCredentials;
                        });
                      }
                    }
                  },
                  child: const Text(
                    loginTitle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
