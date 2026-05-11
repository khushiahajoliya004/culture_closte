import 'dart:async';
import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../theme/app_colors.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppConstants.routeSplash2);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: FadeTransition(
        opacity: _fadeAnim,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Full splash screen composite from Figma
            Image.asset(
              'assets/images/splash_screen_full.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/splash_bg.png',
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, e, s) => Container(color: AppColors.gradientStart),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.white.withValues(alpha: 0.3),
                          AppColors.white.withValues(alpha: 0.85),
                        ],
                      ),
                    ),
                  ),
                  Center(child: _buildTextLogo()),
                ],
              ),
            ),
            // Logo overlay (centered, on top of bg)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/logo_full.png',
                    width: 220,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/images/logo.png',
                      width: 200,
                      errorBuilder: (ctx, e, s) => _buildTextLogo(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextLogo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.primaryMaroon,
            borderRadius: BorderRadius.circular(40),
          ),
          child: const Icon(Icons.checkroom, color: AppColors.white, size: 44),
        ),
        const SizedBox(height: 16),
        const Text(
          'Culture Closet',
          style: TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: AppColors.deepTeal,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Pre-loved South Asian Fashion',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: AppColors.textGray,
          ),
        ),
      ],
    );
  }
}
