import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CategoryModel {
  final String id;
  final String name;
  final String imageUrl;
  final Color backgroundColor;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.backgroundColor = AppColors.categoryCardBg,
  });

  static List<CategoryModel> get homeCategories => [
        const CategoryModel(
          id: '1',
          name: 'Women',
          imageUrl: 'assets/images/cat_women.png',
        ),
        const CategoryModel(
          id: '2',
          name: 'Men',
          imageUrl: 'assets/images/cat_men.png',
        ),
        const CategoryModel(
          id: '3',
          name: 'Kids',
          imageUrl: 'assets/images/cat_kids.png',
        ),
      ];

  static List<CategoryModel> get allCategories => [
        const CategoryModel(
          id: '1',
          name: 'Women',
          imageUrl: 'assets/images/cat_women.png',
        ),
        const CategoryModel(
          id: '2',
          name: 'Men',
          imageUrl: 'assets/images/cat_men.png',
        ),
        const CategoryModel(
          id: '3',
          name: 'Kids',
          imageUrl: 'assets/images/cat_kids.png',
        ),
        const CategoryModel(
          id: '4',
          name: 'Navaratri Collection',
          imageUrl: 'assets/images/cat_navaratri.png',
        ),
        const CategoryModel(
          id: '5',
          name: 'Sarees',
          imageUrl: 'assets/images/cat_sarees.png',
        ),
        const CategoryModel(
          id: '6',
          name: 'Jewellery',
          imageUrl: 'assets/images/cat_jewellery.png',
        ),
        const CategoryModel(
          id: '7',
          name: 'Blouses',
          imageUrl: 'assets/images/cat_blouses.png',
        ),
        const CategoryModel(
          id: '8',
          name: 'Foot Wear',
          imageUrl: 'assets/images/cat_footwear.png',
        ),
        const CategoryModel(
          id: '9',
          name: 'Lehenga',
          imageUrl: 'assets/images/cat_lehenga.png',
        ),
        const CategoryModel(
          id: '10',
          name: 'Accessories',
          imageUrl: 'assets/images/cat_accessories.png',
        ),
        const CategoryModel(
          id: '11',
          name: 'Kurtis',
          imageUrl: 'assets/images/cat_kurtis.png',
        ),
      ];
}
