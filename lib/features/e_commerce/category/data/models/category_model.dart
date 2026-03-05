import 'package:friut_hub/features/e_commerce/category/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity{
  CategoryModel({required super.id, required super.name});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],

    );
  }
}
