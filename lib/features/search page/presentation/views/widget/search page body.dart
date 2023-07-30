import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgete/custom loading state.dart';
import '../../../../../core/widgete/custom vertical list view.dart';
import '../../../../../core/widgete/error messsage state.dart';
import '../../../manager/search manager/search cubit.dart';
import '../../../manager/search manager/search state.dart';
import 'custom text field.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
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
              child: BlocBuilder<SearchBookCubit, SearchBookState>(
                builder: (context, state) {
                  if (state is SearchBookSuccessState) {
                    return CustomVerticalListView(books: state.books);
                  } else if (state is SearchBookInitialState) {
                    return const Center(
                      child: Text('Search for any book '),
                    );
                  } else if (state is SearchBookFailureState) {
                    return ErrorMessageState(errorMessage: state.errorMessage);
                  } else {
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
