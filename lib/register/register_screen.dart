import 'package:flutter/material.dart';
import 'package:mushu_app/authentication/auth.dart';
import 'package:mushu_app/user/model/user_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final Auth _auth = Auth();
  final _formKey = GlobalKey<FormState>();
  String? _errorMessage;

  String? _email;
  String? _password;
  String? _phoneNumber;
  String? _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mushu App',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                onSaved: (value) => _name = value,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) => value != null && !value.contains('@')
                    ? 'Invalid email'
                    : null,
                onSaved: (value) => _email = value,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
                onSaved: (value) => _phoneNumber = value,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) => value != null && value.length < 7
                    ? 'Password too short'
                    : null,
                onSaved: (value) => _password = value,
                obscureText: true,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    String? uid = await _auth.registerWithEmailAndPassword(
                        _email!, _password!);
                    if (uid != null) {
                      Navigator.pushReplacementNamed(
                        context,
                        '/home',
                      );
                    } else {
                      setState(() {
                        _errorMessage = uid;
                      });
                    }
                  }
                },
                child: const Text(
                  'Register',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
