import '../../domain/entities/shoe_entity.dart';
import '../../domain/repositories/shoe_repository_interface.dart';
import '../models/shoe_model.dart';

class ShoeRepository implements ShoeRepositoryInterface {
  final List<Shoe> _favouriteShoes = [];
  final List<Shoe> _cartShoes = [];
  List<Shoe> _shoes = []; // Centralized list of shoes

  ShoeRepository() {
    _initializeShoes();
  }

  // Initialize shoes with mock data
  Future<void> _initializeShoes() async {
    _shoes = [
      ShoeModel(
        id: '1',
        name: 'Nike Air Max',
        price: 752.00,
        imageUrl: 'assets/images/shoe2.png',
        description:
            'The Max Air 270 unit delivers unrivaled, all-day comfort...',
      ),
      ShoeModel(
        id: '2',
        name: 'Nike Jordan',
        price: 302.00,
        imageUrl: 'assets/images/shoe1.png',
        description: 'Nike Air Jordan is one of the most popular shoes...',
      ),
      ShoeModel(
        id: '3',
        name: 'Nike Club Max',
        price: 402.00,
        imageUrl: 'assets/images/shoe3.png',
        description: 'Nike Club Max is one of the most popular shoes...',
      ),
      ShoeModel(
        id: '4',
        name: 'Nike Club Max',
        price: 507.00,
        imageUrl: 'assets/images/shoe4.png',
        description: 'Nike Club Max is one of the most popular shoes...',
      ),
      ShoeModel(
        id: '5',
        name: 'Nike Air Max',
        price: 498.00,
        imageUrl: 'assets/images/shoe5.png',
        description: 'Nike Air Max is one of the most popular shoes...',
      ),
      ShoeModel(
        id: '6',
        name: 'Nike Jordan',
        price: 999.00,
        imageUrl: 'assets/images/shoe6.png',
        description: 'Nike Air Jordan is one of the most popular shoes...',
      ),
    ];
  }

  @override
  Future<List<Shoe>> getShoes() async {
    await Future.delayed(
        const Duration(milliseconds: 500)); // Simulate network delay
    return _shoes;
  }

  @override
  Future<List<Shoe>> getFavouriteShoes() async {
    return _shoes.where((shoe) => shoe.isFavorite).toList();
  }

  @override
  Future<void> addToFavorites(Shoe shoe) async {
    shoe.isFavorite = true;
    if (!_favouriteShoes.contains(shoe)) {
      _favouriteShoes.add(shoe);
    }
  }

  @override
  Future<void> removeFromFavorites(Shoe shoe) async {
    shoe.isFavorite = false;
    _favouriteShoes.remove(shoe);
  }

  @override
  Future<List<Shoe>> getCartShoes() async {
    return _shoes.where((shoe) => shoe.isInCart).toList();
  }

  @override
  Future<void> addToCart(Shoe shoe) async {
    shoe.isInCart = true;
    if (!_cartShoes.contains(shoe)) {
      _cartShoes.add(shoe);
    }
  }

  @override
  Future<void> removeFromCart(Shoe shoe) async {
    shoe.isInCart = false;
    _cartShoes.remove(shoe);
  }

  @override
  Future<void> clearCart() async {
    for (var shoe in _shoes) {
      shoe.isInCart = false;
    }
    _cartShoes.clear();
  }
}
