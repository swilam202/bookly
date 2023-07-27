

import 'package:bookly/core/widgete/book%20image.dart';
import 'package:bookly/features/home%20page/data/models/book_model/book_model.dart';
import 'package:bookly/features/home%20page/presentation/views/book%20details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home page/presentation/views/widgets/custom recommended list view item.dart';
import '../utils/router.dart';

class CustomHorizontalListView extends StatelessWidget {
  const CustomHorizontalListView({super.key, required this.books,});

 // final int itemCount ;
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height:  MediaQuery.of(context).size.height * 0.28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context,index){
         // print( books[index].volumeInfo.imageLinks!.thumbnail);
        //  String image =  ?? 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Fnature%2F&psig=AOvVaw2ZulU0oYKRCJZ9eG5aLjsL&ust=1690552119486000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMiQ1caDr4ADFQAAAAAdAAAAABAL';
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookDetails(book: books[index],),),);
              //GoRouter.of(context).push(AppRouter.rDetails);
            },


            child:  BookImage(image: books[index].volumeInfo.imageLinks!.thumbnail ),);
        },
      ),
    );
  }
}