import 'package:flutter/material.dart';
import 'dart:math';

class Lab3Screen extends StatefulWidget {
  const Lab3Screen({super.key});

  @override
  State<Lab3Screen> createState() => _Lab3ScreenState();
}

class _Lab3ScreenState extends State<Lab3Screen> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFaces() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Dicee'),
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: changeDiceFaces,
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: changeDiceFaces,
                child: Image.asset('images/dice$rightDiceNumber.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
