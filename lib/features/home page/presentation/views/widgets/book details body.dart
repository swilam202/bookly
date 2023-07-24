import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgete/book image.dart';
import '../../../../../core/widgete/book rating.dart';
import '../../../../../core/widgete/custom button.dart';
import '../../../../../core/widgete/custom horizontal list view.dart';
import 'book details app bar.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const BookDetailsAppBar(),
            const SizedBox(height: 30),
            const SizedBox(
              height: 250,
              child: BookImage(),
            ),
            const SizedBox(height: 38),
            const Text(
              'The Jungle Book',
              style: Styles.style30,
            ),
            const SizedBox(height: 6),
            Text(
              'Rudyard Kipling',
              style: Styles.style18.copyWith(
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            const BookRating(),
            const SizedBox(height: 37),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    text: const Text(
                      '19.99\$',
                      style: Styles.style18,
                    ),
                    onPressed: () {},
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: CustomButton(
                    backgroundColor: const Color(0xffEF8262),
                    foregroundColor: Colors.white,
                    text: const Text(
                      'Free Preview',
                      style: Styles.style16,
                    ),
                    onPressed: () {},
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 49),
            Text(
              'You can also like',
              style: Styles.style14.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              height: 120,
              child: CustomHorizontalListView(),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    ));
  }
}
