import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nike_sneaker_store/domain/entities/shoe_entity.dart';
import 'package:nike_sneaker_store/domain/usecases/add_or_remove_favourite.dart';
import 'package:nike_sneaker_store/domain/usecases/get_favourite_shoes.dart';
import 'package:nike_sneaker_store/domain/usecases/get_shoes.dart';

part 'favourite_shoes_state.dart';

class FavouriteShoesCubit extends Cubit<FavouriteShoesState> {
  final GetShoesUseCase getShoesUseCase;
  final GetFavouriteShoesUseCase getFavouriteShoesUseCase;
  final AddToFavoritesUseCase addToFavoritesUseCase;
  final RemoveFromFavoritesUseCase removeFromFavoritesUseCase;

  FavouriteShoesCubit({
    required this.getShoesUseCase,
    required this.getFavouriteShoesUseCase,
    required this.addToFavoritesUseCase,
    required this.removeFromFavoritesUseCase,
  }) : super(ShoeInitial());

  void toggleFavorite(Shoe shoe) async {
    if (shoe.isFavorite) {
      await removeFromFavoritesUseCase(shoe);
    } else {
      await addToFavoritesUseCase(shoe);
    }
    loadFavorites(); // Reload shoes to update the UI
  }

  void loadFavorites() async {
    try {
      emit(FavouriteShoeLoading());
      final favoriteShoes = await getFavouriteShoesUseCase();
      emit(FavoriteShoeLoaded(favoriteShoes));
    } catch (_) {
      emit(FavouriteShoeError('Failed to load favorite shoes'));
    }
  }
}
