import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';
import '../../theme/app_colors.dart';
import '../../widgets/home/product_card.dart';
import '../product_detail/product_detail_screen.dart';

class AllProductsScreen extends StatefulWidget {
  final String? initialCategory;

  const AllProductsScreen({super.key, this.initialCategory});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  late final TextEditingController _searchController;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<AppProvider>();
      provider.clearFilters();
      if (widget.initialCategory != null) {
        provider.setCategory(widget.initialCategory!);
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    context.read<AppProvider>().clearFilters();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final products = provider.filteredProducts;

        return Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Column(
              children: [
                _buildHeader(context, provider),
                _buildSearchBar(provider),
                const Divider(height: 1, color: AppColors.borderLight),
                Expanded(
                  child: products.isEmpty
                      ? _buildEmpty(provider)
                      : _buildProductsGrid(context, provider, products),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, AppProvider provider) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.bgLight,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 16,
                color: AppColors.textDark,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              widget.initialCategory != null
                  ? widget.initialCategory!
                  : 'All Products',
              style: GoogleFonts.playfairDisplay(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.textDark,
              ),
            ),
          ),
          if (provider.selectedCategory.isNotEmpty || provider.searchQuery.isNotEmpty)
            GestureDetector(
              onTap: () {
                _searchController.clear();
                provider.clearFilters();
                if (widget.initialCategory != null) {
                  provider.setCategory(widget.initialCategory!);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.bgLight,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Clear',
                  style: GoogleFonts.lora(
                    fontSize: 12,
                    color: AppColors.primaryMaroon,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(AppProvider provider) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.bgLight,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.borderMid, width: 1),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _searchController,
                focusNode: _focusNode,
                onChanged: (val) => provider.setSearchQuery(val),
                style: GoogleFonts.albertSans(
                  fontSize: 14,
                  color: AppColors.textDark,
                ),
                decoration: InputDecoration(
                  hintText: 'Search items....',
                  hintStyle: GoogleFonts.albertSans(
                    fontSize: 14,
                    color: AppColors.textPlaceholder,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            if (_searchController.text.isNotEmpty)
              GestureDetector(
                onTap: () {
                  _searchController.clear();
                  provider.setSearchQuery('');
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.close, size: 16, color: AppColors.textGray),
                ),
              ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primaryMaroon,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.search, color: AppColors.white, size: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmpty(AppProvider provider) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: AppColors.borderMid,
            ),
            const SizedBox(height: 16),
            Text(
              'No products found',
              style: GoogleFonts.playfairDisplay(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Try a different search term or browse another category.',
              textAlign: TextAlign.center,
              style: GoogleFonts.lora(
                fontSize: 14,
                color: AppColors.textGray,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _searchController.clear();
                provider.clearFilters();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.primaryMaroon,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Clear Filters',
                  style: GoogleFonts.lora(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsGrid(BuildContext context, AppProvider provider, products) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 185 / 280,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          product: product,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailScreen(product: product),
            ),
          ),
          onAddToCart: () => provider.addToCart(product.id),
        );
      },
    );
  }
}
