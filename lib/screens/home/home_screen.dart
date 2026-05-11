import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constants/app_constants.dart';
import '../../providers/app_provider.dart';
import '../../theme/app_colors.dart';
import '../../widgets/home/category_card.dart';
import '../../widgets/home/country_card.dart';
import '../../widgets/home/product_card.dart';
import '../../widgets/home/section_header.dart';
import '../categories/all_categories_screen.dart';
import '../products/all_products_screen.dart';
import '../product_detail/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  String _selectedCurrency = 'USD \$';

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  _buildSearchRow(context),
                  _buildFilterTabs(provider),
                  _buildCategoriesSection(context, provider),
                  _buildHowItWorksSection(),
                  _buildFeaturedListings(context, provider),
                  _buildQuickCategories(context),
                  _buildExploreByCategorySection(context),
                  _buildExploreByCountry(),
                  _buildCustomerStories(),
                  _buildAboutSection(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/logo_icon.png',
            height: 36,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              'assets/images/logo.png',
              height: 36,
              errorBuilder: (ctx, e, s) => Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.primaryMaroon,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.checkroom, color: AppColors.white, size: 18),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Culture Closet',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.deepTeal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AllProductsScreen()),
              ),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: AppColors.bgLight,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.borderMid, width: 1),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Search items....',
                        style: GoogleFonts.albertSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textPlaceholder,
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.primaryMaroon,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(Icons.search, color: AppColors.white, size: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: _showCurrencyPicker,
            child: Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.borderMid, width: 1),
              ),
              child: Row(
                children: [
                  Text(
                    _selectedCurrency,
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textDarkBrown,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.keyboard_arrow_down, size: 14, color: AppColors.textDarkBrown),
                ],
              ),
            ),
          ),
          const SizedBox(width: 6),
          Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.borderMid, width: 1),
            ),
            child: Row(
              children: [
                const Icon(Icons.tune, size: 14, color: AppColors.textDarkBrown),
                const SizedBox(width: 4),
                Text(
                  'ALL',
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textDarkBrown,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCurrencyPicker() {
    showModalBottomSheet(
      context: context,
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: AppConstants.currencies
            .map((c) => ListTile(
                  title: Text(c),
                  onTap: () {
                    setState(() => _selectedCurrency = c);
                    Navigator.pop(context);
                  },
                ))
            .toList(),
      ),
    );
  }

  Widget _buildFilterTabs(AppProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(AppConstants.filterTabs.length, (i) {
            final isActive = provider.selectedFilterTab == i;
            return GestureDetector(
              onTap: () => provider.setFilterTab(i),
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    Text(
                      AppConstants.filterTabs[i],
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
                        color: isActive ? AppColors.primaryMaroon : AppColors.textBrown,
                      ),
                    ),
                    const SizedBox(height: 2),
                    if (isActive)
                      Container(
                        height: 2,
                        width: 20,
                        color: AppColors.primaryMaroon,
                      ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildCategoriesSection(BuildContext context, AppProvider provider) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: 'Categories',
            actionLabel: 'View All',
            onActionTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AllCategoriesScreen()),
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: provider.homeCategories.map((cat) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CategoryCard(
                    category: cat,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AllProductsScreen(initialCategory: cat.name),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorksSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(
        color: AppColors.bgPinkLight,
        borderRadius: BorderRadius.circular(6),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/how_it_works.png',
            width: double.infinity,
            height: 140,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How it Works',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryMaroon,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Ready to declutter your South Asian wardrobe and find a new home for your outfits?',
                  style: GoogleFonts.lora(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textDark,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryMaroon,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'For Sellers',
                        style: GoogleFonts.lora(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.accentOrange,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Learn More',
                        style: GoogleFonts.lora(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedListings(BuildContext context, AppProvider provider) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: 'Featured Listings',
            actionLabel: 'View All',
            onActionTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AllProductsScreen()),
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: provider.featuredProducts.map((product) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ProductCard(
                    product: product,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(product: product),
                      ),
                    ),
                    onAddToCart: () => provider.addToCart(product.id),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickCategories(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...AppConstants.quickCategories.map(
            (cat) => GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AllProductsScreen(initialCategory: cat),
                ),
              ),
              child: Text(
                cat,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                  height: 26 / 16,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AllCategoriesScreen()),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.accentOrange,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'View All',
                style: GoogleFonts.lora(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExploreByCategorySection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: 'Explore by Category',
            actionLabel: 'View All',
            onActionTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AllCategoriesScreen()),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Save money and be sustainable by shopping pre-loved South Asian clothing, jewellery, accessories and decoration.',
            style: GoogleFonts.lora(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textDark,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExploreByCountry() {
    final countries = [
      {'name': 'Australia', 'emoji': '🇦🇺', 'image': 'assets/images/country_australia.png'},
      {'name': 'United States', 'emoji': '🇺🇸', 'image': 'assets/images/country_usa.png'},
      {'name': 'Canada', 'emoji': '🇨🇦', 'image': 'assets/images/country_canada.png'},
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: 'Explore by Country',
            actionLabel: 'View All',
            onActionTap: () {},
          ),
          const SizedBox(height: 8),
          Text(
            'Explore 4000+ pre-loved South Asian fashion and accessories. Now available in Australia, United States, Canada, United Kingdom and New Zealand.',
            style: GoogleFonts.lora(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textDark,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: countries.map((c) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CountryCard(
                    country: c['name']!,
                    flagEmoji: c['emoji']!,
                    imageAsset: c['image']!,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerStories() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Customer Stories',
            style: GoogleFonts.playfairDisplay(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryMaroon,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Stories from the People Who Trust Us',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: AppColors.bgVeryLight,
              borderRadius: BorderRadius.circular(6),
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/customer_story.png',
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        '"Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,"',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lora(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: AppColors.textGray,
                          height: 20 / 12,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Lorem ipsum dolor sit amet,',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      ),
                      Text(
                        'commodo consequat.',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.accentOrange,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Read Our Full Story',
                style: GoogleFonts.lora(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rediscover Elegance Through Pre-Loved South Asian Wear',
            style: GoogleFonts.playfairDisplay(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat',
            style: GoogleFonts.lora(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.textDark,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
