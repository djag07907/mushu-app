import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mushu_app/resources/constants.dart';
import 'package:mushu_app/resources/styles.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  String? _errorMessage;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_errorMessage != null)
                  Text(
                    _errorMessage!,
                    style: const TextStyle(
                      color: errorColor,
                    ),
                  ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: emailLabel,
                  ),
                  validator: (value) => value!.isEmpty || !value.contains('@')
                      ? invalidEmail
                      : null,
                  onSaved: (value) => emailController,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: passwordLabel,
                  ),
                  validator: (value) =>
                      value!.isEmpty || value.length < 7 ? weakPassword : null,
                  onSaved: (value) => passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      login();
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

  void login() async {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      if (user != null) {
        if (kDebugMode) {
          print(loginSuccess);
        }
        Navigator.pushNamed(context, "/home");
      } else {
        if (kDebugMode) {
          print(somethingHappened);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }
  }
}
