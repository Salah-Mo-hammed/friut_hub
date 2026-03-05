import 'package:friut_hub/features/e_commerce/cart/domain/entities/cart_item_entity.dart';

class CartItemModel extends CartItemEntity {
  CartItemModel({
    required super.productId,
    required super.productName,
    required super.price,
    required super.quantity,
    required super.subTotal,
  });
  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      CartItemModel(
        productId: json["productId"],
        productName: json["productName"],
        price: (json["price"] as num).toDouble(),
        quantity: json["quantity"],
        subTotal: (json["subTotal"] as num).toDouble(),
      );
}
