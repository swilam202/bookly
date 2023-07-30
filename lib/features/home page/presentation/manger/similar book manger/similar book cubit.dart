import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home page repo.dart';
import 'similar book state.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  SimilarBookCubit(this.homePageRepo) : super(SimilarBookInitialState());

  HomePageRepo homePageRepo;

  void getData({required String category}) async {
    emit(SimilarBookLoadingState());
    var data = await homePageRepo.fetchSearchSimilarBooks(category: category);
    data.fold((failure) {
      emit(SimilarBookFailureState(errorMessage: failure.errorMessage));
    }, (books) {
      emit(SimilarBookSuccessState(books: books));
    });
  }
}
