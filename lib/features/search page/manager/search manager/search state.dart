import '../../../../core/models/book_model/book_model.dart';

abstract class SearchBookState {}

class SearchBookInitialState extends SearchBookState {}

class SearchBookLoadingState extends SearchBookState {}

class SearchBookFailureState extends SearchBookState {
  String errorMessage;

  SearchBookFailureState(this.errorMessage);
}

class SearchBookSuccessState extends SearchBookState {
  List<BookModel> books;

  SearchBookSuccessState(this.books);
}
