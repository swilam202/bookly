import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgete/custom horizontal list view.dart';
import '../../../../../core/widgete/custom loading state.dart';
import '../../../../../core/widgete/custom vertical list view.dart';
import '../../../../../core/widgete/error messsage state.dart';
import '../../manger/featured book manager/featured book cubit.dart';
import '../../manger/featured book manager/featured book state.dart';
import '../../manger/newest book manager/newest book cubit.dart';
import '../../manger/newest book manager/newest book state.dart';
import 'custom home page appbar.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(),
                  BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
                    builder: (context, state) {
                      if (state is FeaturedBookSuccessState) {
                        return CustomHorizontalListView(
                          books: state.books,
                        );
                      } else if (state is FeaturedBookFailureState) {
                        return ErrorMessageState(
                            errorMessage: state.errorMessage);
                      } else {
                        return const LoadingState();
                      }
                    },
                  ),
                  const SizedBox(height: 48),
                  const Text('Newest Books', style: Styles.style18),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            SliverFillRemaining(
              child: BlocBuilder<NewestBookCubit, NewestBookState>(
                builder: (context, state) {
                  if (state is NewestBookSuccessState) {
                    return CustomVerticalListView(
                      books: state.books,
                    );
                  } else if (state is NewestBookFailureState) {
                    return ErrorMessageState(errorMessage: state.errorMessage);
                  } else {
                    return const LoadingState();
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
