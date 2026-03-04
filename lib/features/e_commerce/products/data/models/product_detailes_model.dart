import 'package:friut_hub/features/e_commerce/products/domain/entities/product_entity.dart';

class ProductDetailesModel extends ProductEntity {
  ProductDetailesModel({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    super.calories,
    super.description,
    super.isOrganic,
    super.expirationPeriodByDays,
    super.stock,
    super.categoryId,
    super.categoryName,
  });

  factory ProductDetailesModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailesModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      calories:json['calories'],
      description:json['description'],
      isOrganic:json['organic'],
      expirationPeriodByDays:json['expirationPeriodByDays'],
      stock:json['stock'],  
      categoryId:json['categoryId'],
      categoryName:json['categoryName']  
      
    );
  }
}
