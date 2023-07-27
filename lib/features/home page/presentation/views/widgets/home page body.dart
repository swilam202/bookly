


import 'package:bookly/core/widgete/custom%20horizontal%20list%20view.dart';
import 'package:bookly/core/widgete/error%20messsage%20state.dart';
import 'package:bookly/core/widgete/loading%20state.dart';
import 'package:bookly/features/home%20page/presentation/manger/newest%20book%20manager/newest%20book%20cubit.dart';
import 'package:bookly/features/home%20page/presentation/manger/newest%20book%20manager/newest%20book%20state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgete/custom vertical list view.dart';
import '../../../data/repos/home page repo implementation.dart';
import '../../manger/featured book manager/featured book cubit.dart';
import '../../manger/featured book manager/featured book state.dart';
import 'custom app bar.dart';

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
   // HomePageRepoImplementation().fetchFeaturedData();
   // HomePageRepoImplementation().fetchFeaturedData();
  }

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomScrollView(
          //
          slivers: [
           SliverToBoxAdapter(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 CustomAppBar(),
                 BlocBuilder<FeaturedBookCubit,FeaturedBookState>(builder: (context,state){
                 //  BlocProvider.of<FeaturedBookCubit>(context).getData();
                   if(state is FeaturedBookSuccessState){
                     //List<String> images = state.books.map((item) => item.volumeInfo.imageLinks!.thumbnail).toList();
                     return CustomHorizontalListView(books: state.books,);
                   }
                   else if(state is FeaturedBookFailureState){
                     return ErrorMessageState(errorMessage: state.errorMessage);
                   }
                   else{
                     return LoadingState();
                   }
                 }),

                 SizedBox(height: 48),
                 Text('Best seller',style: Styles.style18),
                 SizedBox(height: 20),
               ],
             ),
           ),
            SliverToBoxAdapter(


              child:  BlocBuilder<NewestBookCubit,NewestBookState>(builder: (context,state){
                //  BlocProvider.of<FeaturedBookCubit>(context).getData();
                if(state is NewestBookSuccessState){
                 // List<String> images = state.books.map((item) => item.volumeInfo.imageLinks!.thumbnail).toList();
                  return CustomVerticalListView(books: state.books,);
                }
                else if(state is NewestBookFailureState){
                  return ErrorMessageState(errorMessage: state.errorMessage);
                }
                else{
                  return LoadingState();
                }
              }),



            ),

          ],
        ),
      ),
    );
  }
}
