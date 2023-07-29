import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/router.dart';
import 'package:bookly/features/home%20page/presentation/manger/featured%20book%20manager/featured%20book%20cubit.dart';
import 'package:bookly/features/home%20page/presentation/manger/newest%20book%20manager/newest%20book%20cubit.dart';
import 'package:bookly/features/home%20page/presentation/manger/similar%20book%20manger/similar%20book%20cubit.dart';
import 'package:bookly/features/search%20page/manager/search%20manager/search%20cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/home page/data/repos/home page repo implementation.dart';
import 'features/splash screen/presentation/views/splash screen.dart';
//HomePageRepoImplementation impl = HomePageRepoImplementation();
void main() {

  //impl.fetchFeaturedData();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>FeaturedBookCubit(HomePageRepoImplementation())..getData()),
        BlocProvider(create: (context)=>NewestBookCubit(HomePageRepoImplementation())..getData()),
        BlocProvider(create: (context)=> SimilarBookCubit(HomePageRepoImplementation())),
        BlocProvider(create: (context)=> SearchBookCubit( HomePageRepoImplementation())),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
       home: SplashScreen(),
       //routerConfig: AppRouter.router,
      ),
    );
  }
}
