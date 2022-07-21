import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/widget/calculation_widget.dart';
import 'package:bmi_calculator/widget/custom_widget.dart';

import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final double bmiResultat;
  const SecondScreen({this.bmiResultat, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0XFF111427),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: mediaQuery.width * 0.5, top: mediaQuery.height * 0.05),
              child: const Text(
                'Жыйынтык',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: mediaQuery.height * 0.03),
                child: SizedBox(
                  height: mediaQuery.height * 0.7,
                  width: mediaQuery.width * 0.9,
                  child: CustomWidget(
                      widgetChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:  [
                      Text(
                        BmiBrain.getResult(bmiResultat),
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        bmiResultat.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        BmiBrain.getInterpretation(bmiResultat),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CalculationWidget(
        text: 'кайра Эсептоо',
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
