import 'dart:math';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import 'bmi_result_screen.dart';


class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  double height = 100;
  bool isMale = true;
  Color allColors = const Color(0xFFD89BF1);
  Color otherColors = const Color(0xFFF6ED67);
  int weight = 51;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: allColors,
        title: const Text(
          'Bmi Calculator',
        ),
      ),
      body: Container(
        color: Colors.blue[300],
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isMale ? otherColors : allColors,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.male, size: 90),
                              Text(
                                'Male',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isMale ? allColors : otherColors,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.female, size: 90),
                              Text(
                                'Female',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: allColors,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Height',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${height.toInt()}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 40),
                          ),
                          const Text(
                            'cm',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      Slider(
                        max: 220,
                        min: 75,
                        value: height,
                        activeColor: Colors.black,
                        inactiveColor: otherColors,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: allColors,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Weight',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              '$weight',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 40),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  mini: true,
                                  heroTag: 1,
                                  backgroundColor: otherColors,
                                  child: const Icon(Icons.remove,color: Colors.black),
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  mini: true,
                                  heroTag: 2,
                                  backgroundColor: otherColors,
                                  child: const Icon(Icons.add,color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: allColors,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Age',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              '$age',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 40),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                    heroTag: 3,
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    backgroundColor: otherColors,
                                    mini: true,
                                    child: const Icon(Icons.remove,color: Colors.black),),
                                FloatingActionButton(
                                    heroTag: 4,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    backgroundColor: otherColors,
                                    mini: true,
                                    child: const Icon(Icons.add,color: Colors.black),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: allColors,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  var result = weight / pow(height / 100, 2);
                  navigateTo(context, BmiResultScreen(
                      age: age,
                      height: height,
                      isMale: isMale,
                      result: result,
                      weight: weight),);
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
