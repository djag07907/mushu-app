import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mushu_app/resources/constants.dart';
import 'package:mushu_app/resources/styles.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String? _errorMessage;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (_errorMessage != null)
                  Text(
                    _errorMessage!,
                    style: const TextStyle(
                      color: errorColor,
                    ),
                  ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: usernameLabel,
                    hintText: inputUsername,
                  ),
                  // validator: (value) => value != null ? invalidUsername : null,
                  onSaved: (value) => usernameController,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: emailLabel,
                    hintText: inputEmail,
                  ),
                  validator: (value) => value != null && !value.contains('@')
                      ? invalidEmail
                      : null,
                  onSaved: (value) => emailController,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(
                    labelText: phoneNumberLabel,
                    hintText: inputPhoneNumber,
                  ),
                  validator: (value) => value != null && value.length < 8
                      ? invalidPhoneNumber
                      : null,
                  onSaved: (value) => phoneNumberController,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: passwordLabel,
                    hintText: inputPassword,
                  ),
                  validator: (value) =>
                      value != null && value.length < 7 ? weakPassword : null,
                  onSaved: (value) => passwordController,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: confirmPasswordLabel,
                    hintText: inputConfirmPassword,
                  ),
                  // validator: (value) =>
                  //     value != null && value.length < 7 ? weakPassword : null,
                  // onSaved: (value) => passwordController,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      signUp();
                    }
                  },
                  child: const Text(registerTitle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void signUp() async {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      if (user != null) {
        if (kDebugMode) {
          print(userCreated);
        }
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Congratulations!'),
              content: Lottie.asset('assets/animations/paw_loading.json'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: const Text('Go to login screen'),
                ),
              ],
            );
          },
        );
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
