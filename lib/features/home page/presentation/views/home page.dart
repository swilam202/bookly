import 'package:bookly/constants.dart';
import 'package:bookly/features/home%20page/presentation/views/widgets/custom%20app%20bar.dart';
import 'package:bookly/features/home%20page/presentation/views/widgets/home%20page%20body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/styles.dart';

import 'widgets/custom best seller list view item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        body: HomePageBody(),

    );
  }
}









