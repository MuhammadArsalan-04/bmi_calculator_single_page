import './screen/calculate_bmi.dart';
import 'package:flutter/material.dart';

import './screen/bmi_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   canvasColor: Colors.black54,
      // ),
      home: BmiHome(),
      //initialRoute: BmiHome.routeName,
      onUnknownRoute: (routeSetting) {
        BmiHome.routeName;
      },
    );
  }
}
