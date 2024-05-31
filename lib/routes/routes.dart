import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopping/routes/route_names.dart';
import 'package:shopping/screens/favourite_screen.dart';
import 'package:shopping/screens/latest_product.dart';
import 'package:shopping/screens/login_screen.dart';
import 'package:shopping/screens/main_page.dart';
import '../screens/single_screen.dart';

class Routes {
  static PageRoute genareteRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.mainPage:
       return PageTransition(
          child: const MainPage(),
          type: PageTransitionType.scale,
          alignment: Alignment.center,
         duration: const Duration(milliseconds:500 ),
          settings: settings,
        );
      case RouteName.single:
        return PageTransition(
          child: const SingleScreen(),
          type: PageTransitionType.scale,
          alignment: Alignment.center,
          duration: const Duration(milliseconds:500 ),
          settings: settings,
        );
      case RouteName.latestProduct:
        return PageTransition(
          child: const LatestProduct(),
          type: PageTransitionType.scale,
          duration: const Duration(milliseconds:500 ),
          alignment: Alignment.center,
          settings: settings,
        );
      case RouteName.login:
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.scale,
          alignment: Alignment.center,
          duration: const Duration(milliseconds:500 ),
          settings: settings,
        );
      case RouteName.favourite:
        return PageTransition(
          child: const FavouriteScreen(),
          type: PageTransitionType.scale,
          alignment: Alignment.center,
          duration: const Duration(milliseconds:500 ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('page not found!'),
              ),
            );
          },
        );
    }
  }
}
