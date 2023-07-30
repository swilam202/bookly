import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/book_model/book_model.dart';

abstract class HomePageRepo {
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks();

  Future<Either<Failures, List<BookModel>>> fetchNewestBooks();

  Future<Either<Failures, List<BookModel>>> fetchSearchSimilarBooks(
      {required String category});
}
