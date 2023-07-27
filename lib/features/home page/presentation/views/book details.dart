import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgete/book%20image.dart';
import 'package:bookly/core/widgete/book%20rating.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgete/custom button.dart';
import '../../data/models/book_model/book_model.dart';
import 'widgets/book details body.dart';


class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.book});

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: BookDetailsBody(book: book,),
    );
  }
}


