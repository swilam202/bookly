import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api%20service.dart';
import 'package:bookly/features/home%20page/data/models/book_model/book_model.dart';
import 'package:bookly/features/home%20page/data/repos/home%20page%20repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomePageRepoImplementation implements HomePageRepo {
  APIService apiService = APIService(Dio());

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedData() async {
    /// print('went here ----------------------------------------------');
    try {
      Map<String, dynamic> data = await apiService.getData(
          endpoint:
          'Sorting=relevance&q=engineering');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      // print('////////////////////////////// done /////////////////////////////////////////');
      //print('${books[0].kind}***************************************************************');
      // print('went here ++++++++++++++++++++++++++++++++++++++++++++++++++');
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(Failures.exception(e));
      } else { //print('////////////////////////////// done /////////////////////////////////////////');
        return left(Failures('oops! something went wrong'));
      }
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestData() async {
    try {
      Map<String, dynamic> data = await apiService.getData(
          endpoint:
          'Sorting=newest&q=programming');
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
  Future<Either<Failures, List<BookModel>>> fetchSimilarData(
      {required String category}) async {
    try {
      Map<String, dynamic> data = await apiService.getData(
          endpoint:
          'Sorting=newest&q=$category');
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
