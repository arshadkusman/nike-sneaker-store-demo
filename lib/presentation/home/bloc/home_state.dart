import '../../../domain/entities/shoe_entity.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Shoe> shoes;
  HomeLoaded({required this.shoes});
}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}

