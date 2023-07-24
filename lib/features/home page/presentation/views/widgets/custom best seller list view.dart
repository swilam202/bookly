

import 'package:flutter/material.dart';

import 'custom best seller list view item.dart';

class CustomBestSellerListView extends StatelessWidget {
  const CustomBestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 13,
       shrinkWrap: true,
       physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return const CustomBestSellerListViewItem();
        }
    );
  }
}
