class Product {
  final String thumbnail;
  final String title;
  final String brand;
  final int price;
  bool isFav;
  Product({
    required this.thumbnail,
    required this.title,
    required this.price,
    required this.brand,
    this.isFav = false,
  });
}
