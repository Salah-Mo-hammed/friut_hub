import 'package:friut_hub/features/e_commerce/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> items;
  final double totalPrice;

  CartEntity({required this.items, required this.totalPrice});
}
