import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/splash screen/presentation/views/splash screen.dart';



void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kBackgroundColor),
      home: const SplashScreen(),
    );
  }
}