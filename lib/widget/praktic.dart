// ignore_for_file: constant_identifier_names

import 'package:bmi_calculator/widget/custom_widget.dart';
import 'package:bmi_calculator/widget/gender_widget.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Cars { BMW, MERS, TAYOTA_CAMRY, TESLA, NONE }

class MyHome extends StatefulWidget {
  const MyHome({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  double heighValue = 160;
  Color selectedColor = const Color.fromARGB(255, 174, 224, 13);
  Color unselectedColor = const Color.fromARGB(255, 1, 11, 85);
  Cars cars = Cars.NONE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111427),
      appBar: AppBar(
        title: Center(child: const Text('CARS')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomWidget(
                        color:
                            cars == Cars.BMW ? selectedColor : unselectedColor,
                        widgetChild: InkWell(
                          onTap: () {
                            setState(() {
                              cars = Cars.MERS;
                            });
                          },
                          child: const GenderWidget(
                              text: 'BMW', icon: FontAwesomeIcons.car),
                        )),
                    const SizedBox(
                      width: 30,
                    ),
                    CustomWidget(
                      color: cars == Cars.TAYOTA_CAMRY
                          ? selectedColor
                          : unselectedColor,
                      widgetChild: InkWell(
                        onTap: () {
                          setState(() {
                            cars = Cars.TESLA;
                          });
                        },
                        child: GenderWidget(
                          text: 'MERS',
                          icon: FontAwesomeIcons.car,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomWidget(
                        color:
                            cars == Cars.BMW ? selectedColor : unselectedColor,
                        widgetChild: InkWell(
                          onTap: () {
                            setState(() {
                              cars = Cars.MERS;
                            });
                          },
                          child: const GenderWidget(
                              text: 'TOYOTA CAMRY', icon: FontAwesomeIcons.car),
                        )),
                    const SizedBox(
                      width: 30,
                    ),
                    CustomWidget(
                      color: cars == Cars.TAYOTA_CAMRY
                          ? selectedColor
                          : unselectedColor,
                      widgetChild: InkWell(
                        onTap: () {
                          setState(() {
                            cars = Cars.TESLA;
                          });
                        },
                        child: GenderWidget(
                          text: 'TESLA',
                          icon: FontAwesomeIcons.car,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    heighValue.toStringAsFixed(0),
                    style: const TextStyle(
                        fontSize: 60.0, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'cm',
                  ),
                ],
              ),
              Slider(
                activeColor: Colors.blue,
                inactiveColor: Colors.white,
                thumbColor: Colors.greenAccent,
                min: 0,
                value: heighValue.toDouble(),
                max: 220,
                onChanged: (double adamOzgortkonSlider) {
                  setState(() {});
                  heighValue = adamOzgortkonSlider;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
