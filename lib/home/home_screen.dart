import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mushu_app/commons/widgets/side_menu_bar.dart';
// import 'package:mushu_app/onboarding/onboarding_screen.dart';
import 'package:mushu_app/resources/constants.dart';
import 'package:mushu_app/resources/styles.dart';
import 'package:onboarding/onboarding.dart';

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
        // leading: ElevatedButton(
        //   onPressed: () {
        //     Navigator.pushReplacementNamed(context, '/login');
        //   },
        //   child: const Icon(Icons.exit_to_app),
        // ),
        title: const Text(
          mushuAppName,
        ),
      ),
      drawer: const SideMenuBar(),
      // bottomNavigationBar:
      body: const Center(
        child: Text(
          'Welcome to the home page!',
        ),
      ),
    );
  }
}
