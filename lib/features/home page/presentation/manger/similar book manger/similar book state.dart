

import '../../../data/models/book_model/book_model.dart';

class SimilarBookState{}

class SimilarBookInitialState extends SimilarBookState{}
class SimilarBookLoadingState extends SimilarBookState{}
class SimilarBookSuccessState extends SimilarBookState{
  List<BookModel> books;
  SimilarBookSuccessState({required this.books});
}
class SimilarBookFailureState extends SimilarBookState{
  String errorMessage;
  SimilarBookFailureState({required this.errorMessage});
}