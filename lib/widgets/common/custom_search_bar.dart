import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const CustomSearchBar({
    super.key,
    this.hintText = 'Search items....',
    this.onTap,
    this.readOnly = false,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.bgLight,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.borderMid, width: 1),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: readOnly
                  ? Text(
                      hintText,
                      style: GoogleFonts.albertSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textPlaceholder,
                      ),
                    )
                  : TextField(
                      controller: controller,
                      onChanged: onChanged,
                      style: GoogleFonts.albertSans(
                        fontSize: 12,
                        color: AppColors.textDark,
                      ),
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: GoogleFonts.albertSans(
                          fontSize: 12,
                          color: AppColors.textPlaceholder,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        filled: false,
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
              child: const Icon(
                Icons.search,
                color: AppColors.white,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
