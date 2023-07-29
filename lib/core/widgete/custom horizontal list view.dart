

import 'package:bookly/core/widgete/book%20image.dart';
import 'package:bookly/features/home%20page/data/models/book_model/book_model.dart';
import 'package:bookly/features/home%20page/presentation/views/book%20details.dart';
import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';

import '../../features/home page/presentation/views/widgets/custom recommended list view item.dart';
//import '../book model/book model.dart';
import '../utils/router.dart';

class CustomHorizontalListView extends StatelessWidget {
  const CustomHorizontalListView({super.key, required this.books,});

 // final int itemCount ;
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: SizedBox(
        height:  MediaQuery.of(context).size.height * 0.28,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: books.length,
          itemBuilder: (context,index){
               return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookDetails(book: books[index],),),);
              },


              child:  BookImage(image: books[index].volumeInfo.imageLinks?.thumbnail ,),);
          },
        ),
      ),
    );
  }
}