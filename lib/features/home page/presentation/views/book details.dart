import 'package:flutter/material.dart';

import '../../../../core/models/book_model/book_model.dart';
import 'widgets/book details body.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsBody(
        book: book,
      ),
    );
  }
}
