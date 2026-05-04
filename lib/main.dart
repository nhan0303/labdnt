import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyLabsApp());
}

class MyLabsApp extends StatelessWidget {
  const MyLabsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '9 Labs',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
