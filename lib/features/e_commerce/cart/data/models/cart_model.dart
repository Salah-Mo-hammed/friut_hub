import 'package:friut_hub/features/e_commerce/cart/data/models/cart_item_model.dart';
import 'package:friut_hub/features/e_commerce/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({required super.items, required super.totalPrice});
  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    items:
        (json["items"] as List<dynamic>)
            .map((item) => CartItemModel.fromJson(item))
            .toList(),
    totalPrice: (json["totalPrice"] as num).toDouble(),
  );
}
