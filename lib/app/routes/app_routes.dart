import 'package:e_commerce_app/features/home/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import '../../core/constant/route_names.dart';
import '../../features/home/view/screens/product_details.dart';
import '../../features/home/view/screens/see_all_products.dart';
import '../../features/parent/view/parent_screen.dart';
import '../../features/splash/splash_screen.dart';

class AppRoutes {
  static const String initialRoute = RouteNames.splashScreen;

  static final Map<String, WidgetBuilder> routes = {
    RouteNames.splashScreen: (context) => const SplashScreen(),
    RouteNames.parentScreen: (context) => const ParentScreen(),
    RouteNames.homeScreen: (context) => const HomeScreen(),
    RouteNames.seeAllProducts: (context) => const SeeAllProducts(),
    RouteNames.productDetailsScreen: (context) => const ProductDetailsScreen(),

  };
}