// ignore_for_file: public_member_api_docs, sort_constructors_first

class OrderItemEntity {
  final int productId;
  final String productName;
  final double pricePerPiece;
  final int quantity;
  OrderItemEntity({
    required this.productId,
    required this.productName,
    required this.pricePerPiece,
    required this.quantity,
  });
}
