import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../constants/app_constants.dart';
import '../../theme/app_colors.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.onboardingGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Screen label
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Flash Screen',
                    style: GoogleFonts.lora(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textDark,
                    ),
                  ),
                ),
              ),
              // Phone mockup composite from Figma
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Image.asset(
                    'assets/images/onboard_1_phone.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
                  ),
                ),
              ),
              // Page indicator
              AnimatedSmoothIndicator(
                activeIndex: 0,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.primaryMaroon,
                  dotColor: AppColors.borderMid,
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 3,
                ),
              ),
              const SizedBox(height: 24),
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Explore Best Deals',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryMaroon,
                    height: 40 / 30,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Subtitle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Find items easily near you based on your interest',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lora(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textDark,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Buttons row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Skip
                    GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, AppConstants.routeHome),
                      child: Text(
                        'Skip',
                        style: GoogleFonts.lora(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkTeal,
                        ),
                      ),
                    ),
                    // Next button
                    GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, AppConstants.routeSplash3),
                      child: Container(
                        width: 100,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.primaryMaroon,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Next',
                          style: GoogleFonts.lora(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Center(
      child: Container(
        width: 240,
        height: 320,
        decoration: BoxDecoration(
          color: AppColors.bgPeach.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(
          Icons.checkroom,
          size: 80,
          color: AppColors.primaryMaroon,
        ),
      ),
    );
  }
}
