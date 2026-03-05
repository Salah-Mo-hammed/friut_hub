// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:friut_hub/core/endpoints/endpoints.dart';

import 'package:friut_hub/features/e_commerce/category/data/models/category_model.dart';
import 'package:friut_hub/features/e_commerce/products/data/models/product_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<ProductModel>> getCategoryProducts(int id);
  Future<List<CategoryModel>> getAllCategories();
}

class CategoryDsWithDio implements CategoryRemoteDataSource {
  final Dio dio;
  CategoryDsWithDio({
    required this.dio,
  });

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final response = await dio.get(Endpoints.getAllCategories);
    print("status code for getting products: ${response.statusCode}");
    print("getting the prodcuts ${response.data}");
    final List<CategoryModel> categories =
        (response.data as List<dynamic>)
            .map((product) => CategoryModel.fromJson(product))
            .toList();

    return categories;
  }

  @override
  Future<List<ProductModel>> getCategoryProducts(int id) async {
    final response = await dio.get(
      "${Endpoints.getAllCategories}/$id/products",
    );
    print(
      "status code for getting category products: ${response.statusCode}",
    );
    print("getting the prodcuts ${response.data}");

    final List<ProductModel> products =
        (response.data as List<dynamic>)
            .map((product) => ProductModel.fromJson(product))
            .toList();

    return products;
  }
}
