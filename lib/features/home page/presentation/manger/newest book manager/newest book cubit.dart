import 'package:bookly/features/home%20page/data/repos/home%20page%20repo.dart';
import 'package:bookly/features/home%20page/presentation/manger/newest%20book%20manager/newest%20book%20state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBookCubit extends Cubit<NewestBookState>{
  NewestBookCubit(this.homePageRepo):super(NewestBookInitialState());
  HomePageRepo homePageRepo;

  void getData()async{
    emit(NewestBookLoadingState());
    var data = await homePageRepo.fetchNewestData();
    data.fold((failure) {
      emit(NewestBookFailureState(failure.errorMessage));
    } , (books){
      emit(NewestBookSuccessState(books));
    } );
  }
}