

import 'package:bookly/core/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../data/repos/home page repo implementation.dart';
import '../../manger/featured book manager/featured book cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 25,bottom: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(kLogo),
          IconButton(onPressed: ()async{
            GoRouter.of(context).push(AppRouter.rSearch);
            //BlocProvider.of<FeaturedBookCubit>(context).getData();
           // print('done /////////////////////////////////////////');
          }, icon: const Icon(Icons.search),),
        ],
      ),
    );
  }
}
