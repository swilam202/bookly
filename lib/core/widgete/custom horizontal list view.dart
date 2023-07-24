

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home page/presentation/views/widgets/custom recommended list view item.dart';
import '../utils/router.dart';

class CustomHorizontalListView extends StatelessWidget {
  const CustomHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  MediaQuery.of(context).size.height * 0.28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              GoRouter.of(context).push(AppRouter.rDetails);
            },

            child: const CustomListViewItem(),);
        },
      ),
    );
  }
}