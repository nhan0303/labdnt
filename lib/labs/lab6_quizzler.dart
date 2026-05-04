import 'package:flutter/material.dart';

class Lab6Screen extends StatefulWidget {
  const Lab6Screen({super.key});

  @override
  State<Lab6Screen> createState() => _Lab6ScreenState();
}

class _Lab6ScreenState extends State<Lab6Screen> {
  List<Icon> scoreKeeper = [];
  int questionIndex = 0;
  List<String> questions = [
    'Flutter dùng ngôn ngữ Dart?',
    '1 + 1 = 3?',
    'Trái đất hình tròn?',
    '8/3 là ngày quốc tế phụ nữ?',
  ];
  List<bool> answers = [true, false, true, true];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = answers[questionIndex];
    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
      }
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      } else {
        // Reset quiz
        questionIndex = 0;
        scoreKeeper.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(title: const Text('Quizzler')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  questions[questionIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () => checkAnswer(true),
                child: const Text(
                  'True',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () => checkAnswer(false),
                child: const Text(
                  'False',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ),
          Row(children: scoreKeeper),
        ],
      ),
    );
  }
}
