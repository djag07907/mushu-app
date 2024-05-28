import 'package:flutter/material.dart';
import 'package:mushu_app/resources/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: const Icon(Icons.exit_to_app),
        ),
        title: const Text(
          mushuAppName,
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to the home page!',
        ),
      ),
    );
  }
}
