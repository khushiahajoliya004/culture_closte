import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../../providers/app_provider.dart';
import '../../theme/app_colors.dart';
import '../../widgets/home/product_card.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel? product;

  const ProductDetailScreen({super.key, this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final int _currentImageIndex = 0;

  ProductModel get product =>
      widget.product ?? ProductModel.sampleProducts.first;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildImageSection(context),
                        _buildProductInfo(),
                        _buildSellerAndDelivery(),
                        _buildTabSection(),
                        _buildProductSpecs(),
                        _buildSimilarProducts(context, provider),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 380,
          width: double.infinity,
          color: AppColors.bgLight,
          child: Image.asset(
            product.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: AppColors.bgLight,
              child: const Center(
                child: Icon(
                  Icons.checkroom,
                  size: 80,
                  color: AppColors.borderMid,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 12,
          left: 20,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 16,
                color: AppColors.textDark,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (i) {
              return Container(
                width: i == _currentImageIndex ? 20 : 6,
                height: 6,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  color: i == _currentImageIndex
                      ? AppColors.primaryMaroon
                      : AppColors.borderMid,
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  product.name,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textDark,
                    height: 1.0,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '${product.currency} ${product.price}',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryMaroon,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text(
                'Buy Now',
                style: GoogleFonts.lora(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSellerAndDelivery() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primaryMaroon,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  product.sellerInitials,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                product.sellerName,
                style: GoogleFonts.lora(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: AppColors.borderLight),
          const SizedBox(height: 8),
          Text(
            'Select delivery method',
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.blueGray,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Delivery method',
            style: GoogleFonts.lora(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSection() {
    const tabs = ['Details', 'Location', 'Reviews', 'About the owner'];
    return Column(
      children: [
        const SizedBox(height: 12),
        Container(height: 1, color: AppColors.borderLight),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelStyle: GoogleFonts.lora(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
            unselectedLabelStyle: GoogleFonts.lora(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.textGray,
            ),
            labelColor: AppColors.textDark,
            unselectedLabelColor: AppColors.textGray,
            indicatorColor: AppColors.primaryMaroon,
            indicatorSize: TabBarIndicatorSize.label,
            dividerColor: Colors.transparent,
            tabs: tabs.map((t) => Tab(text: t)).toList(),
          ),
        ),
        Container(height: 1, color: AppColors.borderLight),
      ],
    );
  }

  Widget _buildProductSpecs() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _specRow('Country*', product.country),
          _specRow('Condition*', product.condition),
          _specRow('Estimate Purchase Price*', '\$${product.price}'),
          _specRow('Primary Colour', product.primaryColour),
          _specRow('Country of origin', product.countryOfOrigin),
          const SizedBox(height: 12),
          Text(
            product.description,
            style: GoogleFonts.lora(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.textDark,
              height: 20 / 16,
            ),
          ),
          const SizedBox(height: 12),
          _specRow('Price negotiable?*', product.priceNegotiable ? 'Yes' : 'No'),
          const SizedBox(height: 8),
          Text(
            'Occasion',
            style: GoogleFonts.lora(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            product.occasion,
            style: GoogleFonts.lora(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textDark,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _specRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 180,
            child: Text(
              label,
              style: GoogleFonts.lora(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textDark,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.lora(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textDark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimilarProducts(BuildContext context, AppProvider provider) {
    final similar = provider.featuredProducts.take(4).toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Similar Projects',
            style: GoogleFonts.playfairDisplay(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryMaroon,
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: similar.map((p) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ProductCard(
                    product: p,
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(product: p),
                      ),
                    ),
                    onAddToCart: () => provider.addToCart(p.id),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
