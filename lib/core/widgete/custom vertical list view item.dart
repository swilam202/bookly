import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../features/home page/presentation/views/book details.dart';
import '../models/book_model/book_model.dart';
import '../utils/styles.dart';
import 'book image.dart';
import 'book rating.dart';

class CustomBestSellerListViewItem extends StatelessWidget {
  const CustomBestSellerListViewItem({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BookDetails(
              book: book,
            ),
          ),
        );
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: 150,
              child: BookImage(image: book.volumeInfo.imageLinks?.thumbnail),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  book.volumeInfo.title ?? 'Untitled',
                  style: Styles.style20.copyWith(fontFamily: kGTSectraFine),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  book.volumeInfo.authors?[0] ?? 'Unknown',
                  style: Styles.style14.copyWith(
                    color: const Color(0xff707070),
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      book.saleInfo?.retailPrice?.amount == null
                          ? 'Free'
                          : book.saleInfo!.retailPrice!.amount.toString(),
                      style:
                          Styles.style20.copyWith(fontWeight: FontWeight.bold),
                    ),
                    BookRating(
                        rates: book.volumeInfo.ratingsCount != null
                            ? book.volumeInfo.ratingsCount.toString()
                            : '0',
                        ratingPercentage: book.volumeInfo.averageRating != null
                            ? book.volumeInfo.averageRating.toString()
                            : '0'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
