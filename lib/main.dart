import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/app_constants.dart';
import 'providers/app_provider.dart';
import 'theme/app_theme.dart';
import 'screens/splash/splash_screen_1.dart';
import 'screens/splash/splash_screen_2.dart';
import 'screens/splash/splash_screen_3.dart';
import 'screens/splash/splash_screen_4.dart';
import 'screens/main_navigation.dart';
import 'screens/categories/all_categories_screen.dart';
import 'screens/products/all_products_screen.dart';
import 'screens/product_detail/product_detail_screen.dart';
import 'models/product_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: const CultureClosetApp(),
    ),
  );
}

class CultureClosetApp extends StatelessWidget {
  const CultureClosetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Culture Closet',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppConstants.routeSplash1,
      routes: {
        AppConstants.routeSplash1: (_) => const SplashScreen1(),
        AppConstants.routeSplash2: (_) => const SplashScreen2(),
        AppConstants.routeSplash3: (_) => const SplashScreen3(),
        AppConstants.routeSplash4: (_) => const SplashScreen4(),
        AppConstants.routeHome: (_) => const MainNavigation(),
        AppConstants.routeAllCategories: (_) => const AllCategoriesScreen(),
        AppConstants.routeAllProducts: (_) => const AllProductsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == AppConstants.routeProductDetail) {
          final product = settings.arguments as ProductModel?;
          return MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: product),
          );
        }
        return null;
      },
    );
  }
}
