import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home page/presentation/views/widgets/custom best seller list view item.dart';
import '../utils/router.dart';

class CustomVerticalListView extends StatelessWidget {
  const CustomVerticalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 13,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return  CustomBestSellerListViewItem(onTap: (){
            GoRouter.of(context).push(AppRouter.rDetails);
          });
        }
    );
  }
}