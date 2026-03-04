// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductEntity {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final int? calories;
  final String? description;
  final bool? isOrganic;
  final int? expirationPeriodByDays;
  final int? stock;
  final int? categoryId;
  final String? categoryName;
  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.calories,
    this.description,
    this.isOrganic,
    this.expirationPeriodByDays,
    this.stock,
    this.categoryId,
    this.categoryName,
  });
}
