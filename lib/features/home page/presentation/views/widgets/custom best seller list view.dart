

import 'package:flutter/material.dart';

import 'custom best seller list view item.dart';

class CustomBestSellerListView extends StatelessWidget {
  const CustomBestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemBuilder: (context,index){
            return const CustomBestSellerListViewItem();
          }
      ),
    );
  }
}
