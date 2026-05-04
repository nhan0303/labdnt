import 'package:flutter/material.dart';

class Lab8Screen extends StatefulWidget {
  const Lab8Screen({super.key});

  @override
  State<Lab8Screen> createState() => _Lab8ScreenState();
}

class _Lab8ScreenState extends State<Lab8Screen> {
  double _height = 170;
  double _weight = 70;
  double? _bmi;
  String _result = '';

  void _calculateBMI() {
    setState(() {
      _bmi = _weight / ((_height / 100) * (_height / 100));
      if (_bmi! < 18.5) {
        _result = 'Thiếu cân';
      } else if (_bmi! >= 18.5 && _bmi! < 25) {
        _result = 'Bình thường';
      } else if (_bmi! >= 25 && _bmi! < 30) {
        _result = 'Thừa cân';
      } else {
        _result = 'Béo phì';
      }
    });
  }

  Color _getResultColor() {
    if (_bmi == null) return Colors.grey;
    if (_bmi! < 18.5) return Colors.blue;
    if (_bmi! >= 18.5 && _bmi! < 25) return Colors.green;
    if (_bmi! >= 25 && _bmi! < 30) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade700, Colors.blue.shade500],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'BMI Calculator',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'Chiều cao: ${_height.round()} cm',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigo.shade900,
                          ),
                        ),
                        Slider(
                          value: _height,
                          min: 100,
                          max: 220,
                          divisions: 120,
                          activeColor: Colors.purple.shade400,
                          inactiveColor: Colors.grey.shade300,
                          onChanged: (value) {
                            setState(() {
                              _height = value;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Cân nặng: ${_weight.round()} kg',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigo.shade900,
                          ),
                        ),
                        Slider(
                          value: _weight,
                          min: 30,
                          max: 150,
                          divisions: 120,
                          activeColor: Colors.purple.shade400,
                          inactiveColor: Colors.grey.shade300,
                          onChanged: (value) {
                            setState(() {
                              _weight = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculateBMI,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade600,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    'Tính BMI',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                if (_bmi != null)
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'BMI: ${_bmi!.toStringAsFixed(1)}',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: _getResultColor(),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          _result,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: _getResultColor(),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
