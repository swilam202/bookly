import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home page/data/repos/home page repo implementation.dart';
import 'search state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.homePageRepo) : super(SearchBookInitialState());
  HomePageRepoImplementation homePageRepo;

  void getData({required String category}) async {
    emit(SearchBookLoadingState());
    var data = await HomePageRepoImplementation()
        .fetchSearchSimilarBooks(category: category);
    data.fold((failure) {
      emit(SearchBookFailureState(failure.errorMessage));
    }, (books) {
      emit(SearchBookSuccessState(books));
    });
  }
}
