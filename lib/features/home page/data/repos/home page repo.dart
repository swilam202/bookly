


import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/book_model/book_model.dart';

abstract class HomePageRepo{
  Future<Either<Failures,List<BookModel>>> fetchFeaturedData();
  Future<Either<Failures,List<BookModel>>> fetchNewestData();
}