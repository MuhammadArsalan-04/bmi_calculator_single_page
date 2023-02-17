import 'package:flutter/material.dart';

class CalculateBmi extends StatelessWidget {
  double bmi;
  Function resetBmi;

  CalculateBmi({
    required this.bmi,
    required this.resetBmi,
  });
  String result = '';

  @override
  Widget build(BuildContext context) {
    if (bmi < 18) {
      result = 'Your Body Is Underweight';
    } else if (bmi >= 18 && bmi < 25) {
      result = 'You Have A Healthy Body';
    } else if (bmi > 25 && bmi <= 30) {
      result = 'You Are Over Weight';
    } else {
      result = 'Your Physical Health Is Obesity';
    }
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF3366FF),
                  Color(0xFF00CCFF),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        title: const Text(
          'Bmi Result',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your BMI Is',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              bmi.toStringAsFixed(0),
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              result,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                resetBmi();
              },
              child: const Text(
                'Calculate Bmi Again',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
