import 'package:bookly/core/widgete/book%20image.dart';
import 'package:bookly/core/widgete/book%20rating.dart';
import 'package:bookly/features/home%20page/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class CustomBestSellerListViewItem extends StatelessWidget {
  const CustomBestSellerListViewItem({super.key,required this.onTap,required this.book});

  final BookModel book;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
           Padding(
            padding:const  EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: 150,
              child: BookImage(image: book.volumeInfo.imageLinks!.thumbnail),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  book.volumeInfo.title!,
                  style: Styles.style20.copyWith(fontFamily: kGTSectraFine),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  book.volumeInfo.authors![0],
                  style: Styles.style14.copyWith(
                    color: const Color(0xff707070),
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     'dode' ,
                      style: Styles.style20.copyWith(fontWeight: FontWeight.bold),
                    ),
                    BookRating(rates: 5,ratingPercentage:  5),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
