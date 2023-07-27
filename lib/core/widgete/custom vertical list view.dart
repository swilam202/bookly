import 'package:bookly/features/home%20page/presentation/views/book%20details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home page/data/models/book_model/book_model.dart';
import '../../features/home page/presentation/views/widgets/custom best seller list view item.dart';
import '../utils/router.dart';

class CustomVerticalListView extends StatelessWidget {
  const CustomVerticalListView({super.key,required this.books});


  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: books.length,
        //shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return  CustomBestSellerListViewItem(onTap: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BookDetails(book: books[index],),),);
          },book: books[index],);
        }
    );
  }
}