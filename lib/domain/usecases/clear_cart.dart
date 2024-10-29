
import 'package:nike_sneaker_store/domain/repositories/shoe_repository_interface.dart';

class ClearCartUseCase {
  final ShoeRepositoryInterface repository;

  ClearCartUseCase(this.repository);

  Future<void> call() {
    return repository.clearCart();
  }
}