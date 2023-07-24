


import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'custom app bar.dart';
import 'custom best seller list view.dart';
import 'custom recommended list view.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: CustomScrollView(
          //
          slivers: [
           SliverToBoxAdapter(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 CustomAppBar(),
                 CustomRecommendedListView(),
                 SizedBox(height: 48),
                 Text('Best seller',style: Styles.style18),
                 SizedBox(height: 20),
               ],
             ),
           ),
            SliverToBoxAdapter(

              child: CustomBestSellerListView(),

            ),

          ],
        ),
      ),
    );
  }
}
