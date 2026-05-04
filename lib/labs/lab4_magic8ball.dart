import 'package:flutter/material.dart';
import 'dart:math';

class Lab4Screen extends StatefulWidget {
  const Lab4Screen({super.key});

  @override
  State<Lab4Screen> createState() => _Lab4ScreenState();
}

class _Lab4ScreenState extends State<Lab4Screen> {
  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Ask Me Anything'),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            setState(() {
              ballNumber = Random().nextInt(5) + 1;
            });
          },
          child: Image.asset('images/ball$ballNumber.png'),
        ),
      ),
    );
  }
}
