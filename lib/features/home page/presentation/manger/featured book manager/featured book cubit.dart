import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home page repo implementation.dart';
import 'featured book state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.homePageRepo) : super(FeaturedBookInitialState());
  HomePageRepoImplementation homePageRepo;

  void getData() async {
    emit(FeaturedBookLoadingState());
    var data = await HomePageRepoImplementation().fetchFeaturedBooks();
    data.fold((failure) {
      emit(FeaturedBookFailureState(failure.errorMessage));
    }, (books) {
      emit(FeaturedBookSuccessState(books));
    });
  }
}
