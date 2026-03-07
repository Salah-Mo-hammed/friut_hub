import 'package:friut_hub/features/e_commerce/order/domain/entities/order_item_entity.dart';

class OrderItemModel extends OrderItemEntity {
  OrderItemModel({
    required super.productId,
    required super.productName,
    required super.pricePerPiece,
    required super.quantity,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      OrderItemModel(
        productId: json["productId"],
        productName: json["productName"],
        pricePerPiece: (json['pricePerPiece'] as num).toDouble(),
        quantity: json["quantity"],
      );
}
