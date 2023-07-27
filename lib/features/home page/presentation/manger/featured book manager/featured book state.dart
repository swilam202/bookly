

import '../../../data/models/book_model/book_model.dart';

abstract class FeaturedBookState{}

class FeaturedBookInitialState extends FeaturedBookState{}
class FeaturedBookLoadingState extends FeaturedBookState{}
class FeaturedBookFailureState extends FeaturedBookState{
  String errorMessage;
  FeaturedBookFailureState(this.errorMessage);
}
class FeaturedBookSuccessState extends FeaturedBookState{
  List<BookModel> books;
  FeaturedBookSuccessState(this.books);
}