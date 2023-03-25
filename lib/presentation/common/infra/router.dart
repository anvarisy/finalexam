import 'package:finalexam/presentation/cart/cart_screen.dart';
import 'package:finalexam/presentation/main/main_screen.dart';
import 'package:finalexam/presentation/user/sign_in_screen.dart';
import 'package:finalexam/presentation/user/sign_up_screen.dart';
import 'package:finalexam/presentation/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import '/presentation/splash/splash_screen.dart';


class AppRouter {
  static const SPLASH = "/splash";
  static const HOME = "/home";
  static const WISHLIST = "/wishlist";
  static const CART = "/cart";
  static const SIGNIN = "/signin";
  static const SIGNUP = "/singup";


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case HOME:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case WISHLIST:
        return MaterialPageRoute(builder: (_) => WishlistScreen());
      case CART:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case SIGNIN:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case SIGNUP:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text("No route"))));
    }
  }
}