// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends CartEvent {
  int productId;
  int quantity;
  AddToCartEvent({required this.productId,required this.quantity});
}
class UpdateProductQInCartEvent extends CartEvent {
  int productId;
  int quantity;
  UpdateProductQInCartEvent({required this.productId,required this.quantity});
}
class GetCartProductsEvent extends CartEvent{}
