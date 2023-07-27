

import '../../../data/models/book_model/book_model.dart';

abstract class NewestBookState{}

class NewestBookInitialState extends NewestBookState{}
class NewestBookLoadingState extends NewestBookState{}
class NewestBookFailureState extends NewestBookState{
  String errorMessage;
  NewestBookFailureState(this.errorMessage);
}
class NewestBookSuccessState extends NewestBookState{
  List<BookModel> books;
  NewestBookSuccessState(this.books);
}