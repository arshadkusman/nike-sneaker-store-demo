import 'package:nike_sneaker_store/domain/entities/shoe_entity.dart';
import 'package:nike_sneaker_store/domain/repositories/shoe_repository_interface.dart';

class AddToCartUseCase {
  final ShoeRepositoryInterface repository;

  AddToCartUseCase(this.repository);

  Future<void> call(Shoe shoe) {
    return repository.addToCart(shoe);
  }
}

class RemoveFromCartUseCase {
  final ShoeRepositoryInterface repository;

  RemoveFromCartUseCase(this.repository);

  Future<void> call(Shoe shoe) {
    return repository.removeFromCart(shoe);
  }
}

