import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'features/home page/data/repos/home page repo implementation.dart';
import 'features/home page/presentation/manger/featured book manager/featured book cubit.dart';
import 'features/home page/presentation/manger/newest book manager/newest book cubit.dart';
import 'features/home page/presentation/manger/similar book manger/similar book cubit.dart';
import 'features/search page/manager/search manager/search cubit.dart';
import 'features/splash screen/presentation/views/splash page.dart';

void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                FeaturedBookCubit(HomePageRepoImplementation())..getData()),
        BlocProvider(
            create: (context) =>
                NewestBookCubit(HomePageRepoImplementation())..getData()),
        BlocProvider(
            create: (context) =>
                SimilarBookCubit(HomePageRepoImplementation())),
        BlocProvider(
            create: (context) => SearchBookCubit(HomePageRepoImplementation())),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
