import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../models/category_model.dart';

class AppProvider extends ChangeNotifier {
  int _currentNavIndex = 0;
  int _selectedFilterTab = 0;
  String _selectedCurrency = 'USD \$';
  String _searchQuery = '';
  String _selectedCategory = '';
  final List<String> _cartItems = [];
  final List<String> _likedItems = [];

  int get currentNavIndex => _currentNavIndex;
  int get selectedFilterTab => _selectedFilterTab;
  String get selectedCurrency => _selectedCurrency;
  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;
  List<String> get cartItems => _cartItems;
  List<String> get likedItems => _likedItems;

  List<ProductModel> get allProducts => ProductModel.sampleProducts;
  List<CategoryModel> get homeCategories => CategoryModel.homeCategories;
  List<CategoryModel> get allCategories => CategoryModel.allCategories;

  List<ProductModel> get featuredProducts => ProductModel.sampleProducts;

  List<ProductModel> get filteredProducts {
    var list = ProductModel.sampleProducts;
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      list = list.where((p) =>
        p.name.toLowerCase().contains(q) ||
        p.category.toLowerCase().contains(q)).toList();
    }
    if (_selectedCategory.isNotEmpty) {
      list = list.where((p) =>
        p.category.toLowerCase() == _selectedCategory.toLowerCase()).toList();
    }
    return list;
  }

  void setNavIndex(int index) {
    _currentNavIndex = index;
    notifyListeners();
  }

  void setFilterTab(int index) {
    _selectedFilterTab = index;
    notifyListeners();
  }

  void setCurrency(String currency) {
    _selectedCurrency = currency;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void clearFilters() {
    _searchQuery = '';
    _selectedCategory = '';
    notifyListeners();
  }

  void toggleLike(String productId) {
    if (_likedItems.contains(productId)) {
      _likedItems.remove(productId);
    } else {
      _likedItems.add(productId);
    }
    notifyListeners();
  }

  void addToCart(String productId) {
    if (!_cartItems.contains(productId)) {
      _cartItems.add(productId);
      notifyListeners();
    }
  }

  bool isLiked(String productId) => _likedItems.contains(productId);
}
