// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartError extends CartState {
  String message;
  CartError({
    required this.message,
  });
}

class CartroductsLoaded extends CartState {
  CartEntity cartItems;
  CartroductsLoaded({required this.cartItems});
}
