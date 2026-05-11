import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../constants/app_constants.dart';
import '../../theme/app_colors.dart';

class SplashScreen4 extends StatelessWidget {
  const SplashScreen4({super.key});

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
                    'assets/images/onboard_3_phone.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
                  ),
                ),
              ),
              // Page indicator — last dot is active, small indicator shows "active"
              AnimatedSmoothIndicator(
                activeIndex: 2,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.primaryMaroon,
                  dotColor: AppColors.borderMid,
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 3,
                ),
              ),
              // Extra "active" tick indicator from Figma
              const SizedBox(height: 8),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.primaryMaroon,
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: AppColors.borderMid, width: 1),
                ),
              ),
              const SizedBox(height: 24),
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Chat and Make Offer',
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
                  'Contact easily to negotiate price and make offer',
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
              // Bottom actions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Let's Explore button (full width)
                    GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, AppConstants.routeHome),
                      child: Container(
                        width: double.infinity,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.primaryMaroon,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Let\'s Explore',
                          style: GoogleFonts.lora(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Do not show again
                    GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, AppConstants.routeHome),
                      child: Text(
                        'Do not show again',
                        style: GoogleFonts.lora(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textDark,
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
          Icons.chat_bubble_outline,
          size: 80,
          color: AppColors.primaryMaroon,
        ),
      ),
    );
  }
}
