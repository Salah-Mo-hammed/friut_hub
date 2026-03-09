import 'package:friut_hub/features/e_commerce/products/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
  id: map['id'],
  name: map['name'],
  price: map['price'],
  imageUrl: map['imageUrl'],
);

Map<String, dynamic> toMap() => {
  'id': id,
  'name': name,
  'price': price,
  'imageUrl': imageUrl,
};
}
