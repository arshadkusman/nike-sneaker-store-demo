import '../../domain/entities/shoe_entity.dart';

class ShoeModel extends Shoe {
  ShoeModel({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.description,
    super.isFavorite, 
  });

  factory ShoeModel.fromJson(Map<String, dynamic> json) {
    return ShoeModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      isFavorite: json['isFavorite'], 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
    };
  }
}
