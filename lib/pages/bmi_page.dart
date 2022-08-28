import 'package:bmi_calculator/app_constants/colors/app_colors.dart';
import 'package:bmi_calculator/data/enams/gender_enam.dart';
import 'package:bmi_calculator/data/repositories/bmi_repo.dart';
import 'package:bmi_calculator/widgets/main_widget/custom_widget.dart';
import 'package:bmi_calculator/widgets/buttons/weigth_age_widget.dart';
import 'package:bmi_calculator/widgets/buttons/gender_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'result_page..dart';
import '../widgets/buttons/calculation_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double heightValue = 160;
  int weight = 60;
  Color selectedColor = AppColors.selectedColor;
  Color unselectedColor = AppColors.unselectedColor;
  int age = 19;

  Gender gender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
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
                        color: gender == Gender.male
                            ? selectedColor
                            : unselectedColor,
                        widgetChild: InkWell(
                          onTap: () {
                            setState(() {
                              gender = Gender.male;
                            });
                          },
                          child: const GenderWidget(
                              text: 'maLe', icon: FontAwesomeIcons.mars),
                        )),
                    const SizedBox(
                      width: 30,
                    ),
                    CustomWidget(
                      color: gender == Gender.female
                          ? selectedColor
                          : unselectedColor,
                      widgetChild: InkWell(
                        onTap: () {
                          setState(() {
                            gender = Gender.female;
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
                        activeColor: AppColors.red,
                        inactiveColor: AppColors.blue,
                        thumbColor: AppColors.green,
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
                bmiResultat: BmiRepo.calculateBmi(
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
