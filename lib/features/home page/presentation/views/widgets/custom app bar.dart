

import 'package:bookly/core/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 25,bottom: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(kLogo),
          IconButton(onPressed: (){
            GoRouter.of(context).push(AppRouter.rSearch);
          }, icon: const Icon(Icons.search),),
        ],
      ),
    );
  }
}
