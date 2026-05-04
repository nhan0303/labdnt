import 'package:flutter/material.dart';

class Lab1Screen extends StatelessWidget {
  const Lab1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("I Am Rich"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'I am Rich',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Image.asset('images/diamond.png'),
          ],
        ),
      ),
    );
  }
}
