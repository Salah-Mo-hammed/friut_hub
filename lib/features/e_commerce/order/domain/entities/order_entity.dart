import 'package:friut_hub/features/e_commerce/order/domain/entities/order_item_entity.dart';

class OrderEntity {
  final int orderId;
  final int userId;
  final String customerFullName;
  final String customerAddress;
  final String customerCity;
  final int customerDepartment;
  final String customerPhoneNumber;
  final double  subPrice;
  final double totalPrice;
  final double  shippingFees;
  final String orderStatus;
  final List<OrderItemEntity> items;

  OrderEntity({
    required this.orderId,
    required this.userId,
    required this.customerFullName,
    required this.customerAddress,
    required this.customerCity,
    required this.customerDepartment,
    required this.customerPhoneNumber,
    required this.subPrice,
    required this.totalPrice,
    required this.shippingFees,
    required this.orderStatus,
    required this.items,
  });
}
