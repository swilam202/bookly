import 'package:flutter/material.dart';

import '../models/book_model/book_model.dart';
import 'custom vertical list view item.dart';

class CustomVerticalListView extends StatelessWidget {
  const CustomVerticalListView({super.key, required this.books});

  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CustomBestSellerListViewItem(
          book: books[index],
        );
      },
    );
  }
}
