
import 'package:bookly/core/widgete/custom%20vertical%20list%20view.dart';
import 'package:bookly/core/widgete/loading%20state.dart';
import 'package:bookly/features/search%20page/manager/search%20manager/search%20cubit.dart';
import 'package:bookly/features/search%20page/manager/search%20manager/search%20state.dart';
import 'package:bookly/features/search%20page/presentation/views/widget/custom%20text%20field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgete/error messsage state.dart';


class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 18,horizontal: 25),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomTextField(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SliverFillRemaining(
              child: BlocBuilder<SearchBookCubit,SearchBookState>(
                builder: (context,state){
                  if(state is SearchBookSuccessState){
                    return CustomVerticalListView(books: state.books);
                  }
                  else if(state is SearchBookInitialState){
                    return Center(child: Text('Search for any book '),);
                  }
                  else if(state is SearchBookFailureState){
                    return ErrorMessageState(errorMessage: state.errorMessage);
                  }
                  else{
                    return LoadingState();
                  }
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
