import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';

class SplashBody extends StatelessWidget {
   SplashBody({super.key,required this.logoAnimation,required this.qoutesAnimation});

    Animation<Offset> logoAnimation;
   Animation<double> qoutesAnimation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlideTransition(
          position: logoAnimation,
          child: SvgPicture.asset(
            kLogo,
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
        const SizedBox(height: 15),
        FadeTransition(
          opacity: qoutesAnimation,
          child: const Text(
            'Reading is essential for those who seek to rise above the ordinary." - Jim Rohn',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
