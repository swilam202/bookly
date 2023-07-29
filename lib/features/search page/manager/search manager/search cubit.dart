


import 'package:bookly/features/search%20page/manager/search%20manager/search%20state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home page/data/repos/home page repo implementation.dart';

class SearchBookCubit extends Cubit<SearchBookState>{
  SearchBookCubit(this.homePageRepo):super(SearchBookInitialState());
  HomePageRepoImplementation homePageRepo;

  void getData({required String category})async{
    emit(SearchBookLoadingState());
    var data = await HomePageRepoImplementation().fetchSimilarData(category: category);
    data.fold((failure) {
      emit(SearchBookFailureState(failure.errorMessage));
    } , (books){
      emit(SearchBookSuccessState(books));
    } );
  }
}