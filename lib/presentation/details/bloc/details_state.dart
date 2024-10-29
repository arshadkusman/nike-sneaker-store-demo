import '../../../domain/entities/shoe_entity.dart';

abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final Shoe shoe;
  DetailsLoaded({required this.shoe});
}
