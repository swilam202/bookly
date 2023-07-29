
import 'package:bookly/features/home%20page/data/repos/home%20page%20repo%20implementation.dart';
import 'package:bookly/features/home%20page/presentation/manger/similar%20book%20manger/similar%20book%20state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home page repo.dart';
import '../newest book manager/newest book state.dart';

class SimilarBookCubit extends Cubit<SimilarBookState>{
  SimilarBookCubit( this.homePageRepo):super(SimilarBookInitialState());


  HomePageRepo homePageRepo;
  void getData({required String category})async{
    emit(SimilarBookLoadingState());
    var data = await homePageRepo.fetchSimilarData(category: category);
    data.fold((failure) {
      emit(SimilarBookFailureState(errorMessage: failure.errorMessage));
    } , (books){
      emit(SimilarBookSuccessState(books: books));
    } );
  }

}