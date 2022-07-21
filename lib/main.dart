import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/second.dart';
import 'package:bmi_calculator/widget/calculation_widget.dart';
import 'package:bmi_calculator/widget/custom_widget.dart';
import 'package:bmi_calculator/widget/gender_widget.dart';
import 'package:bmi_calculator/widget/weigth_age_widget.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  MALE,
  FEMALE,
  NONE,
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(color: Colors.blue),
          scaffoldBackgroundColor: Colors.green),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: MyHome(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double heightValue = 160;
  int weight = 60;
  Color selectedColor = const Color(0xff103B4B);
  Color unselectedColor = const Color(0xff393B4B);
  int age = 19;

  Gender gender = Gender.NONE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF111427),
      appBar: AppBar(
        backgroundColor: Color(0XFF111427),
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
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
                        color: gender == Gender.MALE
                            ? selectedColor
                            : unselectedColor,
                        widgetChild: InkWell(
                          onTap: () {
                            setState(() {
                              gender = Gender.MALE;
                            });
                          },
                          child: const GenderWidget(
                              text: 'maLe', icon: FontAwesomeIcons.mars),
                        )),
                    const SizedBox(
                      width: 30,
                    ),
                    CustomWidget(
                      color: gender == Gender.FEMALE
                          ? selectedColor
                          : unselectedColor,
                      widgetChild: InkWell(
                        onTap: () {
                          setState(() {
                            gender = Gender.FEMALE;
                          });
                        },
                        child: const GenderWidget(
                          text: 'female',
                          icon: FontAwesomeIcons.venus,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomWidget(
                  widgetChild: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Height',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            heightValue.toStringAsFixed(0),
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
                        thumbColor: Color.fromARGB(255, 204, 85, 125),
                        min: 0,
                        value: heightValue.toDouble(),
                        max: 220,
                        onChanged: (double adamOzgortkonSlider) {
                          setState(() {});
                          heightValue = adamOzgortkonSlider;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  CustomWidget(
                    widgetChild: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: WeightAgeWidget(
                        text: 'Weight',
                        numberText: weight.toString(),
                        onpressedMinus: () {
                          setState(() {
                            weight--;
                          });
                        },
                        onpressedPlus: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  CustomWidget(
                    widgetChild: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: WeightAgeWidget(
                        text: 'Age',
                        numberText: age.toString(),
                        onpressedMinus: () {
                          setState(() {
                            age--;
                          });
                        },
                        onpressedPlus: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CalculationWidget(
        text: 'эсепте',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondScreen(
                bmiResultat: BmiBrain.calculateBmi(
                  weight: weight,
                  height: heightValue.toInt(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
