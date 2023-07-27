

import 'package:flutter/material.dart';

import '../utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key,required this.rates,required this.ratingPercentage});

  final int ratingPercentage;
  final int rates;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Color(0xffFFDD4F),
          size: 22,
        ),
        const SizedBox(width: 6.3),
        Text(
          ratingPercentage.toString(),
          style: Styles.style16
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 9),
        Text(
          '($rates)',
          style: Styles.style14.copyWith(
            color: const Color(0xff707070),
          ),
        )
      ],
    );
  }
}
