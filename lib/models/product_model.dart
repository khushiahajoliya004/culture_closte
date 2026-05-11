class ProductModel {
  final String id;
  final String name;
  final String price;
  final String currency;
  final String imageUrl;
  final String sellerName;
  final String sellerInitials;
  final String condition;
  final String country;
  final String countryOfOrigin;
  final String primaryColour;
  final String occasion;
  final String description;
  final bool priceNegotiable;
  final String category;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.currency,
    required this.imageUrl,
    this.sellerName = 'Kavita V',
    this.sellerInitials = 'KV',
    this.condition = 'New without tags',
    this.country = 'New Zealand',
    this.countryOfOrigin = 'India',
    this.primaryColour = 'Other',
    this.occasion = 'Festive (Diwali, Eid, Christmas etc.)',
    this.description =
        'All bags are Fully handcrafted and gives you a luxury feel.. Goes with both traditional and western dresses..',
    this.priceNegotiable = false,
    this.category = 'Sarees',
  });

  static List<ProductModel> get sampleProducts => [
        const ProductModel(
          id: '1',
          name: 'Black & Mustard Saree',
          price: '45.00',
          currency: 'AU \$',
          imageUrl: 'assets/images/product_1.png',
          category: 'Sarees',
        ),
        const ProductModel(
          id: '2',
          name: 'Baby pink lehenga',
          price: '225.00',
          currency: 'CA \$',
          imageUrl: 'assets/images/product_2.png',
          category: 'Lehenga',
        ),
        const ProductModel(
          id: '3',
          name: 'Black & Mustard Saree',
          price: '45.00',
          currency: 'AU \$',
          imageUrl: 'assets/images/product_3.png',
          category: 'Sarees',
        ),
        const ProductModel(
          id: '4',
          name: 'Baby pink lehenga',
          price: '225.00',
          currency: 'CA \$',
          imageUrl: 'assets/images/product_4.png',
          category: 'Lehenga',
        ),
        const ProductModel(
          id: '5',
          name: 'Black & Mustard Saree',
          price: '45.00',
          currency: 'AU \$',
          imageUrl: 'assets/images/product_1.png',
          category: 'Sarees',
        ),
        const ProductModel(
          id: '6',
          name: 'Baby pink lehenga',
          price: '225.00',
          currency: 'CA \$',
          imageUrl: 'assets/images/product_2.png',
          category: 'Lehenga',
        ),
      ];
}
