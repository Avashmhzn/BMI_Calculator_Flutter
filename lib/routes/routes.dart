import 'package:bim_cal/screen/home/enums/gender.dart';
import 'package:bim_cal/screen/home/view/result_screen.dart';
import 'package:flutter/material.dart';

class Routes{
  navigateToResultScreen(BuildContext context,
      {required double height,required double weight,required Gender gender}){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResultScreen(
      height: height,gender: gender,weight: weight
    ),
    ),
    );
  }
}
