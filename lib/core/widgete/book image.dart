import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookImage extends StatelessWidget {
  const BookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      child: AspectRatio(
        aspectRatio: 2.7/4,
        child: SvgPicture.asset('assets/images/test image.svg',fit: BoxFit.cover,),),
    );
  }
}
