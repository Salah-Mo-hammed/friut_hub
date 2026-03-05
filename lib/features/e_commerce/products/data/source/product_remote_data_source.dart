// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:friut_hub/core/endpoints/endpoints.dart';
import 'package:friut_hub/features/e_commerce/products/data/models/category_model.dart';
import 'package:friut_hub/features/e_commerce/products/data/models/product_detailes_model.dart';

import 'package:friut_hub/features/e_commerce/products/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<List<ProductModel>> getCategoryProducts(int id);
  Future<List<CategoryModel>> getAllCategories();
  Future<ProductDetailesModel> getDetaildProduct(String id);
  Future<List<ProductModel>> searchProducts(String searchQuery);
}

class ProductDsWithDio implements ProductRemoteDataSource {
  final Dio dio;
  ProductDsWithDio({required this.dio});
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await dio.get(Endpoints.getAllProducts);
    print("status code for getting products: ${response.statusCode}");
    print("getting the prodcuts ${response.data}");

    final List<ProductModel> products =
        (response.data as List<dynamic>)
            .map((product) => ProductModel.fromJson(product))
            .toList();

    return products;
  }

  @override
  Future<ProductDetailesModel> getDetaildProduct(String id) async {
    final response = await dio.get("${Endpoints.getAllProducts}/$id");
    print(
      "status code for getting detaild  product: ${response.statusCode}",
    );
    print("getting the  detaild prodcut ${response.data}");
    final ProductDetailesModel detailedProduct =
        ProductDetailesModel.fromJson(response.data);
    return detailedProduct;
  }

  @override
  Future<List<ProductModel>> searchProducts(
    String searchQuery,
  ) async {
    final response = await dio.get(
      Endpoints.getAllProducts,
      queryParameters: {"Search": searchQuery},
    );
    print("status code for getting products: ${response.statusCode}");
    print("getting the prodcuts ${response.data}");

    final List<ProductModel> products =
        (response.data as List<dynamic>)
            .map((product) => ProductModel.fromJson(product))
            .toList();

    return products;
  }

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
