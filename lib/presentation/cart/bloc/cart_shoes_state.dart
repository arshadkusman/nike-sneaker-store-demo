part of 'cart_shoes_cubit.dart';

abstract class CartShoesState extends Equatable {
  @override
  List<Object> get props => [];
}

class ShoeInitial extends CartShoesState {}

class CartShoeLoading extends CartShoesState {}



class CartShoesLoaded extends CartShoesState {
  final List<Shoe> cartShoes;

  CartShoesLoaded(this.cartShoes);

  @override
  List<Object> get props => [cartShoes];
}

class CartShoesError extends CartShoesState {
  final String message;

  CartShoesError(this.message);

  @override
  List<Object> get props => [message];
}
