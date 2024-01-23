import 'dart:math';

import 'package:bim_cal/global/Colors.dart';
import 'package:bim_cal/screen/home/enums/gender.dart';
import 'package:bim_cal/screen/home/model/range.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResultScreen extends StatefulWidget {
  double height;
  double weight;
  Gender gender;

  ResultScreen(
      {super.key,
      required this.weight,
      required this.gender,
      required this.height});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  double bim = 0.0;

  List<BMIRange> bmiList = [
    BMIRange(
      name: 'UnderWeight',
      lowerRange: 0,
      upperRange: 18.5,
    ),
    BMIRange(
      name: 'Normal weight',
      lowerRange: 18.5,
      upperRange: 24.9,
    ),
    BMIRange(
      name: 'OverWeight',
      lowerRange: 25,
      upperRange: 29.9,
    ),
    BMIRange(
      name: 'Obesity',
      lowerRange: 30,
      upperRange: 0,
    ),
  ];

  @override
  void initState() {
    calculateBMI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Result',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Your BMI Result',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: LPrimaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 300,
            child: CircularPercentIndicator(
              radius: 130,
              lineWidth: 25,
              animation: true,
              circularStrokeCap: CircularStrokeCap.round,
              percent: bim / 100,
              center: Text(
                bim.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: LPrimaryColor,
                  fontFamily: 'Quicksand',
                ),
              ),
              progressColor: LIndicater,
              backgroundColor: LPrimaryColor.withOpacity(0.2),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.builder(
                itemCount: bmiList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  var currentBold = false;
                  if (bim < bmiList[index].upperRange &&
                      bim >= bmiList[index].lowerRange) {
                    currentBold = true;
                  }
                  if (bmiList[index].name == "Obesity" &&
                      bim > bmiList[index].lowerRange) {
                    currentBold = true;
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 25, bottom: 18, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${getData(bmiList[index].lowerRange)} ${getOperator(
                            lowerRange: bmiList[index].lowerRange,
                            upperRange: bmiList[index].upperRange,
                          )} ${getData(bmiList[index].upperRange)}',
                          style: TextStyle(
                            color: currentBold ? LPrimaryColor : Colors.grey,
                            fontWeight:
                                currentBold ? FontWeight.bold : FontWeight.w600,
                            fontSize: 20,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                        Text(
                          bmiList[index].name,
                          style: TextStyle(
                            color: currentBold ? LPrimaryColor : Colors.grey,
                            fontWeight:
                                currentBold ? FontWeight.w900 : FontWeight.w600,
                            fontSize: 20,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.ios_share,
                    color: Colors.grey,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        fixedSize: const Size(180, 50),
                        side: const BorderSide(color: Colors.blue),
                        foregroundColor: Colors.blue,
                        textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () {},
                    child: const Text('Results'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  calculateBMI() {
    bim = widget.weight / pow(widget.height / 100, 2);
  }

  String getData(double value) {
    if (value == 0) {
      return '';
    } else {
      return value.toString();
    }
  }

  String getOperator({required double lowerRange, required double upperRange}) {
    if (lowerRange == 0) {
      return '<';
    } else if (upperRange == 0) {
      return '>';
    } else {
      return '-';
    }
  }
}
