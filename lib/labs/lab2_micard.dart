import 'package:flutter/material.dart';

class Lab2Screen extends StatelessWidget {
  const Lab2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text('MiCard'),
        backgroundColor: Colors.teal[900],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/avatar.png'),
            ),
            const Text(
              'Le Anh Nhan',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                color: Colors.teal.shade100,
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(color: Colors.teal.shade100),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.teal),
                title: Text(
                  '+84 973 110 845',
                  style: TextStyle(color: Colors.teal.shade900, fontSize: 20.0),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.teal),
                title: Text(
                  'anhnhan0303@gmail.com',
                  style: TextStyle(fontSize: 20.0, color: Colors.teal.shade900),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
