class CartItemEntity {
    final int productId;
  final String productName;
  final double price;
  final int quantity;
  final double subTotal;

  CartItemEntity({required this.productId, required this.productName, required this.price, required this.quantity, required this.subTotal});

}