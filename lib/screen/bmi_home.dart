import 'package:bmi_calcultor/screen/calculate_bmi.dart';
import 'package:flutter/material.dart';

class BmiHome extends StatefulWidget {
  static const routeName = '/bmi-home';
  @override
  State<BmiHome> createState() => _BmiHomeState();
}

class _BmiHomeState extends State<BmiHome> {
  bool isMaleTrue = false;
  bool isFemaleTrue = false;
  int age = 0;

  bool isBmiCalculated = false;

  int height = 0;
  int weight = 0;
 double bmi = 0.0;

  double bmiCalculation(height, weight) {
    return (weight / (height * height)) * 10000;
  }

  void resetBmi() {
    setState(() {
      isBmiCalculated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isBmiCalculated
        ? CalculateBmi(bmi: bmi, resetBmi: resetBmi)
        : Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.orange],
              ),
            ),
            child: Scaffold(
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
                  'Bmi Calculator',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'What Are You?',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: isMaleTrue
                                            ? Colors.blue.shade100
                                            : Colors.white,
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (isMaleTrue == true) {
                                              isMaleTrue = false;
                                            } else {
                                              isMaleTrue == true;
                                            }
                                            isFemaleTrue = false;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.male,
                                          color: Colors.blue.shade500,
                                          size: 60,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text('Male',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: isFemaleTrue
                                            ? Colors.blue.shade100
                                            : Colors.white,
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (isFemaleTrue == true) {
                                              isFemaleTrue = false;
                                            } else {
                                              isFemaleTrue == true;
                                            }
                                            isMaleTrue = false;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.female,
                                          color: Colors.pink.shade500,
                                          size: 60,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Female',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'What\'s Your Age?',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  child: FittedBox(
                                    child: Text(
                                      '$age',
                                      style: const TextStyle(
                                        fontSize: 36,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      icon: const Icon(Icons.keyboard_arrow_up),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (age == 0) {
                                              return;
                                            }
                                            age--;
                                          });
                                        },
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down)),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'What\'s Your height?',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  //keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    height = int.parse(value);
                                  },
                                  decoration: const InputDecoration(
                                      labelText: 'Height in cm'),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'What\'s Your weight?',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  onChanged: (value) {
                                    weight = int.parse(value.toString());
                                  },
                                  //keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'Weight in kg',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF3366FF),
                                    Color(0xFF00CCFF),
                                  ],
                                  begin: FractionalOffset(0.0, 0.0),
                                  end: FractionalOffset(1.0, 0.0),
                                  stops: [0.05, 0.6],
                                  tileMode: TileMode.clamp),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  bmi = bmiCalculation(height, weight);
                                  isBmiCalculated = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent),
                              child: const Text('Calculate Your BMI'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
