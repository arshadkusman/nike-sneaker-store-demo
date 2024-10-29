import '../entities/shoe_entity.dart';
import '../repositories/shoe_repository_interface.dart';

class GetShoesUseCase {
  final ShoeRepositoryInterface repository;

  GetShoesUseCase(this.repository);

  Future<List<Shoe>> call() {
    return repository.getShoes();
  }
}
