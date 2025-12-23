import 'package:e_commerce_app/features/home/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import '../../core/constant/route_names.dart';
import '../../features/auth/presentation/view/create_account.dart';
import '../../features/auth/presentation/view/login_screen.dart';
import '../../features/auth/presentation/view/otp_screen.dart';
import '../../features/categories/categories_screen.dart';
import '../../features/home/view/screens/cart.dart';
import '../../features/home/view/screens/review/create_review.dart';
import '../../features/home/view/screens/product_detail.dart';
import '../../features/home/view/screens/product_details.dart';
import '../../features/home/view/screens/review/reviews.dart';
import '../../features/home/view/screens/see_all_products.dart';
import '../../features/parent/view/parent_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/wish_list/presentation/view/wish_list_screen.dart';

class AppRoutes {
  static const String initialRoute = RouteNames.splashScreen;

  static final Map<String, WidgetBuilder> routes = {
    RouteNames.splashScreen: (context) => const SplashScreen(),
    RouteNames.parentScreen: (context) => const ParentScreen(),
    RouteNames.homeScreen: (context) => const HomeScreen(),
    RouteNames.seeAllProducts: (context) => const SeeAllProducts(),
    RouteNames.productDetailsScreen: (context) => const ProductDetailsScreen(),
    RouteNames.reviews: (context) => const Reviews(),
    RouteNames.cart: (context) => const Cart(),
    RouteNames.loginScreen: (context) => const LoginScreen(),
    RouteNames.createAccount: (context) => const CreateAccount(),
    RouteNames.categoriesScreen: (context) => const CategoriesScreen(),
    RouteNames.wishListScreen: (context) => const WishListScreen(),
    RouteNames.otpScreen: (context) => const OtpScreen(),
    RouteNames.createReview: (context) => const CreateReview(),
    RouteNames.productDetail: (context) => const ProductDetail(),

  };
}