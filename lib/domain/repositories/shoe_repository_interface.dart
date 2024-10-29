import '../entities/shoe_entity.dart';

abstract class ShoeRepositoryInterface {
  Future<List<Shoe>> getShoes();
  Future<List<Shoe>> getFavouriteShoes();
  Future<void> addToFavorites(Shoe shoe);
  Future<void> removeFromFavorites(Shoe shoe);
  Future<List<Shoe>> getCartShoes();
  Future<void> addToCart(Shoe shoe);
  Future<void> removeFromCart(Shoe shoe);
  Future<void> clearCart();
}
