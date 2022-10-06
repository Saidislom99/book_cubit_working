import 'package:book_cubit_working/ui/book/book_page.dart';
import 'package:book_cubit_working/ui/home/home_page.dart';
import 'package:book_cubit_working/utils/constants.dart';
import 'package:flutter/material.dart';

import 'splash/splash_page.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case bookPage:
        return MaterialPageRoute(builder: (_) => const BooksPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
