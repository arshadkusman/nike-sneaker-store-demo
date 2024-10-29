part of 'favourite_shoes_cubit.dart';


abstract class FavouriteShoesState extends Equatable {
  @override
  List<Object> get props => [];
}

class ShoeInitial extends FavouriteShoesState {}

class FavouriteShoeLoading extends FavouriteShoesState {}


class FavoriteShoeLoaded extends FavouriteShoesState {
  final List<Shoe> favoriteShoes;

  FavoriteShoeLoaded(this.favoriteShoes);

  @override
  List<Object> get props => [favoriteShoes];
}


class FavouriteShoeError extends FavouriteShoesState {
  final String message;

  FavouriteShoeError(this.message);

  @override
  List<Object> get props => [message];
}

