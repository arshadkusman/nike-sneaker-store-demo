class Shoe {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  late bool isFavorite;
  late bool isInCart;

  Shoe({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.isFavorite = false,
    this.isInCart = false,
  });
}
