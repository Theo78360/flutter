import 'package:go_router/go_router.dart';
import 'package:store/screens/cart_screen.dart';
import 'package:store/screens/category_details_screen.dart';
import 'package:store/screens/home_screen.dart';
import 'package:store/screens/product_details_screen.dart';

class RouterService {
  //lister les routes
  static GoRouter getRouter() {
    return GoRouter(routes: [
      GoRoute(
        /*
          path : schéma web d'une route
          > l route / doit exister et est considérée comme accueil
          name :nom de la route
        */
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        /*
          path : schéma web d'une route
          > l route / doit exister et est considérée comme accueil
          name :nom de la route
        */
        path: '/product-details',
        name: 'product-details',
        builder: (context, state) => const ProductDetailsScreen(),
      ),
      GoRoute(
        /*
          path : schéma web d'une route
          > l route / doit exister et est considérée comme accueil
          name :nom de la route
        */
        path: '/category-details',
        name: 'category-details',
        builder: (context, state) => const CategoryDetailsScreen(),
      ),
      GoRoute(
        /*
          path : schéma web d'une route
          > l route / doit exister et est considérée comme accueil
          name :nom de la route
        */
        path: '/cart',
        name: 'cart',
        builder: (context, state) => const CartScreen(),
      ),
    ]);
  }
}
