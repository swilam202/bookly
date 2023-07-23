

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(

        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: AspectRatio(
          aspectRatio: 2.7/4,
          child: SvgPicture.asset('assets/images/test image.svg',fit: BoxFit.cover,),),
      ),
    );
  }
}