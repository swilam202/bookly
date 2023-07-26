import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api%20service.dart';
import 'package:bookly/features/home%20page/data/models/book_model/book_model.dart';
import 'package:bookly/features/home%20page/data/repos/home%20page%20repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomePageRepoImplementation extends HomePageRepo {
  APIService apiService = APIService();

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedData() async {
    try {
      Map<String, dynamic> data = await apiService.getData(
          endpoint:
              'Filtering=free-ebooks&Sorting=relevance&q=subject:computer science');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(Failures.exception(e));
      } else {
        return left(Failures('oops! something went wrong'));
      }
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestData() async {
    try {
      Map<String, dynamic> data = await apiService.getData(
          endpoint:
              'Filtering=free-ebooks&Sorting=newest&q=subject:computer science');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(Failures.exception(e));
      } else {
        return left(Failures('oops! something went wrong'));
      }
    }
  }
}
