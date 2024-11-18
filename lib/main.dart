import 'package:flutter/material.dart';
import 'package:git_test1/home.dart';
import 'package:git_test1/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Git Learning 1',
      routes: {
        '/': (context) => const Login(),
        '/home': (context) => const HomePage(),
      },
      initialRoute: '/',
    );
  }
}
