import 'package:flutter/material.dart';
import 'package:furniture_app/pages/category_page.dart';
import 'package:furniture_app/pages/home_page.dart';
import 'package:furniture_app/pages/onboarding_page.dart';
import 'package:furniture_app/pages/search_page.dart';
import 'package:furniture_app/pages/search_result_page.dart';
import 'package:furniture_app/pages/sign_in_page.dart';
import 'package:furniture_app/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/onboarding': (context) => const OnBoardingPage(),
        '/sign-in': (context) => const SigninPage(),
        '/homepage': (context) => const HomePage(),
        '/search': (context) => const SearchPage(),
        '/search-result-page': (context) => const SearchResultPage(),
        '/category':(context) => const CategoryPage(),
      },
    );
  }
}
