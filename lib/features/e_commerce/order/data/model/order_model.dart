import 'package:friut_hub/features/e_commerce/order/data/model/order_item_model.dart';
import 'package:friut_hub/features/e_commerce/order/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.orderId,
    required super.userId,
    required super.customerFullName,
    required super.customerAddress,
    required super.customerCity,
    required super.customerDepartment,
    required super.customerPhoneNumber,
    required super.subPrice,
    required super.totalPrice,
    required super.shippingFees,
    required super.orderStatus,
    required super.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      OrderModel(
        orderId: json["orderId"],
        userId: json["userId"],
        customerFullName: json["customerFullName"],
        customerAddress: json["customerAddress"],
        customerCity: json["customerCity"],
        customerDepartment: json["customerDepartment"],
        customerPhoneNumber: json["customerPhoneNumber"],
        subPrice: (json["subPrice"] as num).toDouble(),
        totalPrice: (json["totalPrice"] as num).toDouble(),
        shippingFees: (json["shippingFees"] as num).toDouble(),
        orderStatus: json["orderStatus"],
        items: (json["items"] as List<dynamic>).map((item)=>OrderItemModel.fromJson(item)).toList(),
      );
}
