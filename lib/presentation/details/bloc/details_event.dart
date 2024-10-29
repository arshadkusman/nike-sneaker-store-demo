import '../../../domain/entities/shoe_entity.dart';

abstract class DetailsEvent {}

class LoadShoeDetailsEvent extends DetailsEvent {
  final Shoe shoe;
  LoadShoeDetailsEvent({required this.shoe});
}
