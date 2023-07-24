import 'package:bookly/core/widgete/book%20image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class CustomBestSellerListViewItem extends StatelessWidget {
  const CustomBestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       const Padding(
         padding: EdgeInsets.symmetric(vertical: 10),
         child: SizedBox(
            height: 150,
              child: BookImage(),),
       ),
        const SizedBox(width: 30),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Harry Potter and the Goblet of Fire',
                style: Styles.style20.copyWith(fontFamily: kGTSectraFine),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                'J.K. Rowling',
                style: Styles.style14.copyWith(
                  color: const Color(0xff707070),
                ),
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '19.99 €',
                    style: Styles.style20.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xffFFDD4F),
                      ),
                      Text(
                        '4.8',
                        style: Styles.style16
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 9),
                      Text(
                        '(2390)',
                        style: Styles.style14.copyWith(
                          color: const Color(0xff707070),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
