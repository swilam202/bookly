
import 'package:bookly/core/widgete/custom%20vertical%20list%20view.dart';
import 'package:bookly/features/search%20page/presentation/views/widget/custom%20text%20field.dart';
import 'package:flutter/material.dart';


class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 18,horizontal: 25),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomTextField(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            // SliverToBoxAdapter(
            //   child: CustomVerticalListView(),
            // )
          ],
        ),
      ),
    );
  }
}
