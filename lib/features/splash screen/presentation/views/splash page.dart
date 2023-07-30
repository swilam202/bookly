import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../home page/presentation/views/home page.dart';
import 'widgets/splash page body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController logoController;
  late Animation<Offset> logoAnimation;
  late AnimationController qoutesController;
  late Animation<double> qoutesAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initSplashAnimation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    logoController.dispose();
    qoutesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: logoAnimation,
        builder: (context, _) {
          return SplashBody(
            logoAnimation: logoAnimation,
            qoutesAnimation: qoutesAnimation,
          );
        },
      ),
    );
  }

  void initSplashAnimation() {
    logoController = AnimationController(
      vsync: this,
      duration: kSplashAnimationDuration,
    );
    logoAnimation = Tween<Offset>(begin: const Offset(-2, -3), end: Offset.zero)
        .animate(logoController);
    qoutesController = AnimationController(
      vsync: this,
      duration: kSplashAnimationDuration,
    );
    qoutesAnimation = Tween<double>(begin: 0, end: 1).animate(logoController);
    logoController.forward().then(
      (value) {
        qoutesController.forward().then(
          (value) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        );
      },
    );
  }
}
