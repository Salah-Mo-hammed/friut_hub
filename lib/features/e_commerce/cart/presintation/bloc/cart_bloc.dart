import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friut_hub/features/e_commerce/cart/domain/usecases/add_to_cart_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  AddToCartUsecase addToCartUsecase;
  CartBloc({required this.addToCartUsecase}) : super(CartInitial()) {
    on<AddToCartEvent>(_onAddToCart);
  }

  FutureOr<void> _onAddToCart(
    AddToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    final result = await addToCartUsecase.call(event.productId,event.quantity);
    result.fold((failure) {
      emit(CartError());
    }, (unit) {
      emit(AddedToCart());

    });
  }
}
