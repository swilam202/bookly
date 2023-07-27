import 'package:bookly/features/home%20page/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgete/book image.dart';
import '../../../../../core/widgete/book rating.dart';
import '../../../../../core/widgete/custom button.dart';
import '../../../../../core/widgete/custom horizontal list view.dart';
import 'book details app bar.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key,required this.book});

  final BookModel book;
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
             SizedBox(
              height: 250,
               child:
                BookImage(
                  image: book.volumeInfo.imageLinks!.thumbnail,
                ),),
            const SizedBox(height: 38),
             Text(
              book.volumeInfo.title!,
              style: Styles.style30,
               textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              book.volumeInfo.authors![0],
              style: Styles.style18.copyWith(
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            BookRating(rates: book.volumeInfo.ratingsCount != null? int.parse(book.volumeInfo.ratingsCount.toString()) : 0,ratingPercentage: book.volumeInfo.averageRating != null? int.parse(book.volumeInfo.averageRating.toString()) : 0),
            const SizedBox(height: 37),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    text: const Text(
                      'Free',
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
              // child: CustomHorizontalListView(
              //   itemCount: 10,
              //   // imageUrl:
              //   //     'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dfstudio.com%2Fdigital-image-size-and-resolution-what-do-you-need-to-know%2F&psig=AOvVaw1LxTwdsxqzUBhxLlCCgHG6&ust=1690550460439000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCOjn6q_9roADFQAAAAAdAAAAABAE',
              // ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    ));
  }
}
