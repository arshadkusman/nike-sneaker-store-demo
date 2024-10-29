import 'package:nike_sneaker_store/domain/entities/shoe_entity.dart';
import 'package:nike_sneaker_store/domain/repositories/shoe_repository_interface.dart';

class GetCartShoesUseCase {
  final ShoeRepositoryInterface repository;

  GetCartShoesUseCase(this.repository);

  Future<List<Shoe>> call() {
    return repository.getCartShoes();
  }
}