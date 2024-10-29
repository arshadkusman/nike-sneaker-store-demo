import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nike_sneaker_store/domain/entities/shoe_entity.dart';
import 'package:nike_sneaker_store/domain/usecases/add_or_remove_cart.dart';
import 'package:nike_sneaker_store/domain/usecases/clear_cart.dart';
import 'package:nike_sneaker_store/domain/usecases/get_cart.dart';
import 'package:nike_sneaker_store/domain/usecases/get_shoes.dart';

part 'cart_shoes_state.dart';

class CartShoesCubit extends Cubit<CartShoesState> {
  final GetShoesUseCase getShoesUseCase;
  final GetCartShoesUseCase getCartShoesUseCase;
  final AddToCartUseCase addToCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  final ClearCartUseCase clearCartUseCase;

  CartShoesCubit({
    required this.getShoesUseCase,
    required this.getCartShoesUseCase,
    required this.addToCartUseCase,
    required this.removeFromCartUseCase,
    required this.clearCartUseCase,
  }) : super(ShoeInitial());

 


void toggleCart(Shoe shoe) async {
  if (shoe.isInCart) {
    await removeFromCartUseCase(shoe);
  } else {
    await addToCartUseCase(shoe);
  }
  loadCart(); // Reload shoes to update the UI
}

  void clearCart() async {
   
    await clearCartUseCase();
  
  loadCart();
  }
 

  void loadCart() async {
    try {
      emit(CartShoeLoading());
      final cartShoes = await getCartShoesUseCase();
      emit(CartShoesLoaded(cartShoes));
    } catch (_) {
      emit(CartShoesError('Failed to load cart shoes'));
    }
  }


}
