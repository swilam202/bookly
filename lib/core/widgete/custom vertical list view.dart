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
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return  CustomBestSellerListViewItem(onTap: (){
            GoRouter.of(context).push(AppRouter.rDetails);
          },book: books[index],);
        }
    );
  }
}