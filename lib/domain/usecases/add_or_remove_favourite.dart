import 'package:nike_sneaker_store/domain/entities/shoe_entity.dart';
import 'package:nike_sneaker_store/domain/repositories/shoe_repository_interface.dart';

class AddToFavoritesUseCase {
  final ShoeRepositoryInterface repository;

  AddToFavoritesUseCase(this.repository);

  Future<void> call(Shoe shoe) {
    return repository.addToFavorites(shoe);
  }
}

class RemoveFromFavoritesUseCase {
  final ShoeRepositoryInterface repository;

  RemoveFromFavoritesUseCase(this.repository);

  Future<void> call(Shoe shoe) {
    return repository.removeFromFavorites(shoe);
  }
}