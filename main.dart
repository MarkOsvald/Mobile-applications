import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
     home: PowerCalculationScreen(),
    );
  }
}

class PowerCalculationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Very Simple Powers"),),
      body: new PowerCalculationWidget(),
    );
  }
}

class PowerCalculationWidget extends StatefulWidget {
  @override
  _PowerCalculationWidgetState createState() => _PowerCalculationWidgetState();
}

class _PowerCalculationWidgetState extends State<PowerCalculationWidget> {
  double base;
  double exponent;
  double result;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(children: [
            Expanded(child: TextField(keyboardType: TextInputType.number, onChanged: (String base) {
              this.base = double.parse(base.replaceAll(",", ''));
            },)),
            Expanded(child: Text('^')),
            Expanded(child: TextField(keyboardType: TextInputType.number, onChanged: (String power) {
              this.exponent = double.parse(power.replaceAll(",", ''));
            },))
          ],),
          Text("Result: $result"),
          ElevatedButton(
            child: Text("Calculate"),
            onPressed: () {
              setState(() {
                result = calculatePower(base, exponent);
              });
            },)
        ],
      ),
    );
  }

  double calculatePower(double base, double exponent) => pow(base, exponent);
}

