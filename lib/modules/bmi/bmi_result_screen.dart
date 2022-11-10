import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  bool isMale;
  int age;
  double height;
  int weight;
  double result;

  BmiResultScreen({Key? key,
    required this.result,
    required this.weight,
    required this.age,
    required this.isMale,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD89BF1),
        title: const Text('Bmi Result'),
      ),
      body: Center(
        child: Container(color: Colors.blue[300],
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                'Gender : ${isMale ? 'Male': 'Female'}',
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                'Age : $age',
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                'Height : ${height.round()}',
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                'Weight : $weight',
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                'Result : ${result.toInt()}',
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
