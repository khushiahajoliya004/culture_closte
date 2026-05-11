import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';

enum ButtonVariant { primary, secondary, outline, text }

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final ButtonVariant variant;
  final double? width;
  final double height;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    super.key,
    required this.label,
    this.onTap,
    this.variant = ButtonVariant.primary,
    this.width,
    this.height = 44,
    this.borderRadius = 6,
    this.backgroundColor,
    this.textColor,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color fgColor;
    Border? border;

    switch (variant) {
      case ButtonVariant.primary:
        bgColor = backgroundColor ?? AppColors.primaryMaroon;
        fgColor = textColor ?? AppColors.white;
        break;
      case ButtonVariant.secondary:
        bgColor = backgroundColor ?? AppColors.darkTeal;
        fgColor = textColor ?? AppColors.white;
        break;
      case ButtonVariant.outline:
        bgColor = backgroundColor ?? Colors.transparent;
        fgColor = textColor ?? AppColors.primaryMaroon;
        border = Border.all(color: AppColors.primaryMaroon, width: 1);
        break;
      case ButtonVariant.text:
        bgColor = backgroundColor ?? Colors.transparent;
        fgColor = textColor ?? AppColors.primaryMaroon;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: GoogleFonts.lora(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: fgColor,
          ),
        ),
      ),
    );
  }
}
