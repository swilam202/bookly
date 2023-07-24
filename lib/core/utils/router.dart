


import 'package:bookly/features/home%20page/presentation/views/book%20details.dart';
import 'package:bookly/features/search%20page/presentation/views/serach%20page.dart';
import 'package:go_router/go_router.dart';

import '../../features/home page/presentation/views/home page.dart';
import '../../features/splash screen/presentation/views/splash screen.dart';

abstract class AppRouter {

   static const String rSplash = '/';
   static const String rHome = '/home';
   static const String rDetails = '/details';
   static const String rSearch = '/search';
  static final router = GoRouter(
    routes: [
      GoRoute(path: rSplash,builder: (context,state)=> const SplashScreen(),),
      GoRoute(path: rHome,builder: (context,state)=> const HomePage(),),
      GoRoute(path: rDetails,builder: (context,state)=> const BookDetails(),),
      GoRoute(path: rSearch,builder: (context,state)=> const SearchPage(),),
    ],
  );
}
