


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home page repo.dart';
import 'featured book state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState>{
  FeaturedBookCubit(this.homePageRepo):super(FeaturedBookInitialState());
  HomePageRepo homePageRepo;

  void getData()async{
    emit(FeaturedBookLoadingState());
    var data = await homePageRepo.fetchFeaturedData();
    data.fold((failure) {
      emit(FeaturedBookFailureState(failure.errorMessage));
    } , (books){
      emit(FeaturedBookSuccessState(books));
    } );
  }
}