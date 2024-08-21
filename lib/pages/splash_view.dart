
import 'dart:async';

import 'package:famlaika1/pages/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 5),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body:Stack(
        children: [
          Positioned(
              width: 220,
              height: 65,
              top: 354,
              left: 70,
              child: Image(image:AssetImage("assets/images/imgspl.png")) ),
          Positioned(
              width: 215,
              height: 19,
              top: 427,
              left: 76,
              child: Text("A space for family memories ",style: TextStyle(fontFamily: 'Figtree',fontWeight:FontWeight.w400,
              fontSize: 16,color:Color(0xFFFFFFFF) ),))
        ],
      ) ,
    );
  }
}
