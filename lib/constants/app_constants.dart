class AppConstants {
  AppConstants._();

  // Routes
  static const String routeSplash1 = '/';
  static const String routeSplash2 = '/splash2';
  static const String routeSplash3 = '/splash3';
  static const String routeSplash4 = '/splash4';
  static const String routeHome = '/home';
  static const String routeAllCategories = '/categories';
  static const String routeAllProducts = '/products';
  static const String routeProductDetail = '/product-detail';

  // Spacing
  static const double paddingHorizontal = 20.0;
  static const double paddingVertical = 16.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 12.0;

  // Border Radii
  static const double radiusSmall = 6.0;
  static const double radiusMedium = 10.0;
  static const double radiusLarge = 20.0;
  static const double radiusXLarge = 30.0;
  static const double radiusRound = 40.0;

  // Card Dimensions
  static const double categoryCardWidth = 120.0;
  static const double categoryCardHeight = 168.0;
  static const double productCardWidth = 185.0;
  static const double productCardHeight = 280.0;
  static const double productImageHeight = 200.0;

  // Bar Heights
  static const double bottomNavHeight = 90.0;
  static const double searchBarHeight = 30.0;
  static const double appBarHeight = 60.0;

  // Countries
  static const List<String> countries = [
    'Australia',
    'United States',
    'Canada',
    'United Kingdom',
    'New Zealand',
  ];

  // Category labels
  static const List<String> categoryLabels = [
    'Women',
    'Men',
    'Kids',
    'Navaratri Collection',
    'Sarees',
    'Jewellery',
    'Blouses',
    'Foot Wear',
    'Lehenga',
    'Accessories',
    'Kurtis',
  ];

  // Quick categories on home
  static const List<String> quickCategories = ['Kurtis', 'Blouses', 'Lehengas'];

  // Filter tabs
  static const List<String> filterTabs = [
    'For You',
    'Saved Searches',
    'Live',
    'My Likes',
  ];

  // Currency options
  static const List<String> currencies = ['USD \$', 'AUD \$', 'CAD \$', 'GBP £', 'NZD \$'];
}
