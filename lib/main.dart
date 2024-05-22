import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mushu_app/authentication/auth.dart';
import 'package:mushu_app/firebase_options.dart';
import 'package:mushu_app/home/home_screen.dart';
import 'package:mushu_app/login/login_screen.dart';
import 'package:mushu_app/register/register_screen.dart';
import 'package:mushu_app/splashscreen/splashscreen.dart';
import 'package:mushu_app/user/model/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mushu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
