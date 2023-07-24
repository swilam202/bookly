


import 'package:bookly/core/widgete/custom%20horizontal%20list%20view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgete/custom vertical list view.dart';
import 'custom app bar.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
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
                 CustomHorizontalListView(),
                 SizedBox(height: 48),
                 Text('Best seller',style: Styles.style18),
                 SizedBox(height: 20),
               ],
             ),
           ),
            SliverToBoxAdapter(

              child: CustomVerticalListView(),

            ),

          ],
        ),
      ),
    );
  }
}
