


import 'package:dartz/dartz.dart';

//import '../../../../core/book model/book model.dart';
import '../../../../core/errors/failure.dart';
import '../models/book_model/book_model.dart';

abstract class HomePageRepo{
  Future<Either<Failures,List<BookModel>>> fetchFeaturedData();
  Future<Either<Failures,List<BookModel>>> fetchNewestData();
  Future<Either<Failures,List<BookModel>>> fetchSimilarData({required String category});
  //Future<Either<Failures,List<BookModel>>> fetchSearchData({required String category});
}