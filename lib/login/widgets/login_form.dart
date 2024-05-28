import 'package:flutter/material.dart';
import 'package:mushu_app/authentication/service/auth.dart';
import 'package:mushu_app/resources/constants.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // final Auth _auth = Auth();
  // final _formKey = GlobalKey<FormState>();
  // String? _errorMessage;

  // String? _email;
  // String? _password;

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
                      color: Colors.red,
                    ),
                  ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: emailLabel,
                  ),
                  validator: (value) => value!.isEmpty || !value.contains('@')
                      ? 'Invalid email'
                      : null,
                  onSaved: (value) => email = value!,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: passwordLabel,
                  ),
                  validator: (value) => value!.isEmpty || value.length < 7
                      ? 'Password too short'
                      : null,
                  onSaved: (value) => password = value!,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
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
                          errorMessage =
                              'Incorrect email or password. Please try again.';
                        });
                      }
                    }
                  },
                  child: const Text(loginTitle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
