import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // ── Playfair Display ──────────────────────────────────────────
  static TextStyle playfairSemiBold30 = GoogleFonts.playfairDisplay(
    fontWeight: FontWeight.w600,
    fontSize: 30,
    height: 40 / 30,
    color: AppColors.textDark,
  );

  static TextStyle playfairMedium24 = GoogleFonts.playfairDisplay(
    fontWeight: FontWeight.w500,
    fontSize: 24,
    height: 1.0,
    color: AppColors.textDark,
  );

  static TextStyle playfairMedium20 = GoogleFonts.playfairDisplay(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    height: 1.0,
    color: AppColors.textDark,
  );

  static TextStyle playfairMedium18 = GoogleFonts.playfairDisplay(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    height: 1.0,
    color: AppColors.textDark,
  );

  static TextStyle playfairSemiBold16 = GoogleFonts.playfairDisplay(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 1.0,
    color: AppColors.textDark,
  );

  static TextStyle playfairMedium16 = GoogleFonts.playfairDisplay(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 1.0,
    color: AppColors.textDark,
  );

  static TextStyle playfairMedium12 = GoogleFonts.playfairDisplay(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 16 / 12,
    color: AppColors.textDark,
  );

  // ── Lora ──────────────────────────────────────────────────────
  static TextStyle loraRegular18 = GoogleFonts.lora(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    height: 16 / 18,
    color: AppColors.textDark,
  );

  static TextStyle loraMedium20 = GoogleFonts.lora(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    height: 1.0,
    color: AppColors.textDark,
  );

  static TextStyle loraRegular16 = GoogleFonts.lora(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 20 / 16,
    color: AppColors.textDark,
  );

  static TextStyle loraMedium16 = GoogleFonts.lora(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 26 / 16,
    color: AppColors.textDark,
  );

  static TextStyle loraSemiBold14 = GoogleFonts.lora(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: AppColors.textDark,
  );

  static TextStyle loraMedium14 = GoogleFonts.lora(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 26 / 14,
    color: AppColors.textDark,
  );

  static TextStyle loraRegular14 = GoogleFonts.lora(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 18 / 14,
    color: AppColors.textDark,
    letterSpacing: 0.01 * 14,
  );

  static TextStyle loraSemiBold12 = GoogleFonts.lora(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    height: 14 / 12,
    color: AppColors.textDark,
  );

  static TextStyle loraMediumItalic12 = GoogleFonts.lora(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    fontStyle: FontStyle.italic,
    height: 20 / 12,
    color: AppColors.textGray,
  );

  // ── Albert Sans ───────────────────────────────────────────────
  static TextStyle albertSansRegular16 = GoogleFonts.albertSans(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.0,
    color: AppColors.textPlaceholder,
  );

  static TextStyle albertSansRegular12 = GoogleFonts.albertSans(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 16 / 12,
    color: AppColors.textPlaceholder,
  );

  // ── Open Sans ─────────────────────────────────────────────────
  static TextStyle openSansMedium12 = GoogleFonts.openSans(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 14 / 12,
    color: AppColors.textBrown,
  );

  static TextStyle openSansRegular12 = GoogleFonts.openSans(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 14 / 12,
    color: AppColors.textBrown,
  );

  // ── Roboto ────────────────────────────────────────────────────
  static TextStyle robotoSemiBold17 = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 17,
    height: 22 / 17,
    color: AppColors.textDark,
  );

  static TextStyle robotoRegular16 = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 26 / 16,
    color: AppColors.blueGray,
  );
}
