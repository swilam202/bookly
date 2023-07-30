import 'package:flutter/material.dart';

import '../../features/home page/presentation/views/book details.dart';
import '../models/book_model/book_model.dart';
import 'book image.dart';

class CustomHorizontalListView extends StatelessWidget {
  const CustomHorizontalListView({
    super.key,
    required this.books,
  });

  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.28,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: books.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BookDetails(
                      book: books[index],
                    ),
                  ),
                );
              },
              child: BookImage(
                image: books[index].volumeInfo.imageLinks?.thumbnail,
              ),
            );
          },
        ),
      ),
    );
  }
}
