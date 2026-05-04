import 'package:flutter/material.dart';
import '../labs/lab1_iamrich.dart';
import '../labs/lab2_micard.dart';
import '../labs/lab3_dicee.dart';
import '../labs/lab4_magic8ball.dart';
import '../labs/lab5_xylophone.dart';
import '../labs/lab6_quizzler.dart';
import '../labs/lab7_destini.dart';
import '../labs/lab8_bmicaculator.dart';
import '../labs/lab9_clima.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách tên và màn hình tương ứng của 9 lab
    final List<Map<String, dynamic>> labs = [
      {'title': 'Lab 1: I Am Rich', 'screen': const Lab1Screen()},
      {'title': 'Lab 2: MiCard', 'screen': const Lab2Screen()},
      {'title': 'Lab 3: Dicee', 'screen': const Lab3Screen()},
      {
        'title': 'Lab 4: Challenge 1 - Magic 8 Ball',
        'screen': const Lab4Screen(),
      },
      {'title': 'Lab 5: Xylophone', 'screen': const Lab5Screen()},
      {'title': 'Lab 6: Quizzler', 'screen': const Lab6Screen()},
      {
        'title': 'Lab 7: Boss Level Challenge 2 - Destini',
        'screen': const Lab7Screen(),
      },
      {'title': 'Lab 8: BMI Calculator', 'screen': const Lab8Screen()},
      {'title': 'Lab 9: Clima', 'screen': const Lab9Screen()},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('My Flutter Labs'), centerTitle: true),
      body: ListView.builder(
        itemCount: labs.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                labs[index]['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Điều hướng sang màn hình Lab tương ứng
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => labs[index]['screen'],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
