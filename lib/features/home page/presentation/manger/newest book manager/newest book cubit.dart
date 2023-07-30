import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home page repo.dart';
import 'newest book state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.homePageRepo) : super(NewestBookInitialState());
  HomePageRepo homePageRepo;

  void getData() async {
    emit(NewestBookLoadingState());
    var data = await homePageRepo.fetchNewestBooks();
    data.fold((failure) {
      emit(NewestBookFailureState(failure.errorMessage));
    }, (books) {
      emit(NewestBookSuccessState(books));
    });
  }
}
