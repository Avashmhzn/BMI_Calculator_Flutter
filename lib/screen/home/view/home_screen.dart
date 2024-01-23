import 'dart:math';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:bim_cal/global/Colors.dart';
import 'package:bim_cal/routes/routes.dart';
import 'package:bim_cal/screen/home/enums/gender.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender = Gender.male;
  double height = 150.0;
  double weight = 70.0;
  double bmi = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'BMI ',
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w900,
                          fontSize: 35,
                        ),
                      ),
                      TextSpan(
                        text: 'Calculator',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w300,
                            fontSize: 35,
                            fontFamily: 'Nunito'
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Body mass index (BMI) is a measure of body fat based on height and weight that applies to adult men and women',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                          fontSize: 15
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              /*Row(
                children: [
                  genderCard(
                      gender: Gender.male, imagePath: 'assets/images/man.jpg'),
                  genderCard(
                      gender: Gender.female, imagePath: 'assets/images/girl.jpg'),
                ],
              ),*/
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                  children: [
                    genderCardNew(
                        gender: Gender.male, imagePath: 'assets/images/man.jpg'),
                    genderCardNew(
                        gender: Gender.female, imagePath: 'assets/images/girl.jpg'),
                  ],
                               ),
               ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 110,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: LPrimaryColor.withAlpha(20)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Height: ${height.toStringAsFixed(0)} cm',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: SfLinearGauge(
                                minimum: 100,
                                maximum: 220,
                                markerPointers: [
                                  LinearWidgetPointer(
                                    value: height,
                                    onChanged: (value) {
                                      setState(() {
                                        height = value;
                                      });
                                    }, child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                    ),
                                    child: const Icon(Icons.height,size: 20,color: Colors.white,),
                                  ),
                                  ),
                                ],
                                orientation: LinearGaugeOrientation.horizontal,
                                majorTickStyle: const LinearTickStyle(length: 25),
                                axisLabelStyle: const TextStyle(fontSize: 12.0, color: Colors.black),
                                axisTrackStyle: const LinearAxisTrackStyle(
                                    edgeStyle: LinearEdgeStyle.bothFlat,
                                    thickness: 10,
                                    borderColor: Colors.grey,
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                           color: LPrimaryColor.withAlpha(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weight: ${weight.toStringAsFixed(0)} kg',
                              style: const TextStyle(fontSize: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: SfLinearGauge(
                                minimum: 50,
                                maximum: 100,
                                markerPointers: [
                                  LinearWidgetPointer(
                                    value: weight,
                                    onChanged: (value) {
                                      setState(() {
                                        weight = value;
                                      });
                                    },
                                    child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(color: Colors.blue),
                                    child: const Icon(Icons.monitor_weight_rounded,size: 20,color: Colors.white,),
                                  ),
                                  ),
                                ],

                                orientation: LinearGaugeOrientation.horizontal,
                                majorTickStyle: const LinearTickStyle(length: 20),
                                axisLabelStyle: const TextStyle(fontSize: 12.0, color: Colors.black),
                                axisTrackStyle: const LinearAxisTrackStyle(
                                  edgeStyle: LinearEdgeStyle.bothFlat,
                                  thickness: 10,
                                  borderColor: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    Routes().navigateToResultScreen(context,height: height,gender: selectedGender,weight: weight);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(20)
                    ),
                    fixedSize: const Size(500, 50),
                    textStyle: const TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),
                    backgroundColor: Colors.deepPurpleAccent,
                    foregroundColor: Colors.white,
                    elevation: 15,
                  ),
                  child: const Text('Calculate your BMI →'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  genderCardNew({required Gender gender, required String imagePath}) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          setState(() {
            selectedGender = gender;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
            height: 160,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: LPrimaryColor.withAlpha(30),blurRadius: 8,spreadRadius: 6,offset: const Offset(5, 4)),
                  ],
                  shape: BoxShape.circle
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(imagePath,)),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                       decoration: BoxDecoration(
                         color: gender == selectedGender? Colors.transparent: Colors.white.withOpacity(0.5),
                         shape: BoxShape.circle
                       ),

                      ),
                    ),
                  ],
                ),
            ),
            Text(
              gender.name
                  .replaceFirst(gender.name[0], gender.name[0].toUpperCase()),
              style: const TextStyle(color: Colors.black, fontSize: 15, ),
            ),
          ],
        ),
      ),
    );
  }
}
