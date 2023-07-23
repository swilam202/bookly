

import 'package:flutter/material.dart';

import 'custom recommended list view item.dart';



class CustomRecommendedListView extends StatelessWidget {
  const CustomRecommendedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  MediaQuery.of(context).size.height * 0.28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return const CustomListViewItem();
        },
      ),
    );
  }
}