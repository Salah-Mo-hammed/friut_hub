import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friut_hub/features/e_commerce/cart/domain/entities/cart_entity.dart';
import 'package:friut_hub/features/e_commerce/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:friut_hub/features/e_commerce/cart/domain/usecases/get_cart_products_usecase.dart';
import 'package:friut_hub/features/e_commerce/cart/domain/usecases/update_peoduct_quantity_in_cart_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  AddToCartUsecase addToCartUsecase;
  GetCartProductsUsecase getCartProductsUsecase;
  UpdatePeoductQuantityInCartUsecase
  updatePeoductQuantityInCartUsecase;
  CartBloc({
    required this.addToCartUsecase,
    required this.getCartProductsUsecase,
    required this.updatePeoductQuantityInCartUsecase
  }) : super(CartInitial()) {
    on<AddToCartEvent>(_onAddToCart);
    on<GetCartProductsEvent>(_onGetCartProducts);
    on<UpdateProductQInCartEvent>(_onUpdateCart);
  }

  FutureOr<void> _onAddToCart(
    AddToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    final result = await addToCartUsecase.call(
      event.productId,
      event.quantity,
    );
    result.fold(
      (failure) {
        emit(CartError(message: failure.message));
      },
      (unit) {
        emit(CartInitial());
      },
    );
  }

  FutureOr<void> _onGetCartProducts(
    GetCartProductsEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    final result = await getCartProductsUsecase.call();
    result.fold(
      (failure) {
        emit(CartError(message: failure.message));
      },
      (items) {
        emit(CartroductsLoaded(cartItems: items));
      },
    );
  }

  FutureOr<void> _onUpdateCart(
    UpdateProductQInCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    final result = await updatePeoductQuantityInCartUsecase.call(event.productId, event.quantity);
    result.fold(
      (failure) {
        emit(CartError(message: failure.message));
      },
      (unit) {
        emit(CartInitial());
      },
    );
  }
}
