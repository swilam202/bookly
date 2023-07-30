import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/book_model/book_model.dart';
import '../../../../core/utils/api service.dart';
import 'home page repo.dart';

class HomePageRepoImplementation implements HomePageRepo {
  APIService apiService = APIService(Dio());

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      Map<String, dynamic> data =
          await apiService.getData(endpoint: 'Sorting=relevance&q=engineering');
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
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks() async {
    try {
      Map<String, dynamic> data =
          await apiService.getData(endpoint: 'Sorting=newest&q=programming');
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
  Future<Either<Failures, List<BookModel>>> fetchSearchSimilarBooks(
      {required String category}) async {
    try {
      Map<String, dynamic> data =
          await apiService.getData(endpoint: 'Sorting=newest&q=$category');
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
