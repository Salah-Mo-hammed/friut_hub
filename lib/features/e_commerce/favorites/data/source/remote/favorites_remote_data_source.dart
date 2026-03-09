import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:friut_hub/core/endpoints/endpoints.dart';
import 'package:friut_hub/features/e_commerce/products/data/models/product_model.dart';

abstract class FavoritesRemoteDataSource {
  Future<List<ProductModel>> getAllFavorites();
  Future<Unit> addToFavorites(int productId);
  Future<Unit> removeFromFavorites(int productId);
}

class FavoritesDsWithDio implements FavoritesRemoteDataSource {
  final Dio dio;

  FavoritesDsWithDio({required this.dio});
  @override
  
  Future<Unit> addToFavorites(int productId) async{
 final response = await dio.post("${Endpoints.getAllFavourits}/$productId");

    print("response for addToFavorites  ${response.statusCode}");
    print("response for addToFavorites  ${response.data}");
 

    return unit;
  }

  @override
  Future<List<ProductModel>> getAllFavorites() async{
 final response = await dio.get(Endpoints.getAllFavourits);

    print("response for getting favorites ${response.statusCode}");
    print("response for getting favorites ${response.data}");
     final List<ProductModel> products =
        (response.data as List<dynamic>)
            .map((product) => ProductModel.fromJson(product))
            .toList();

    return products;
     }

  @override
  Future<Unit> removeFromFavorites(int productId) async{
final response = await dio.delete("${Endpoints.getAllFavourits}/$productId");

    print("response for removeFromFavorites  ${response.statusCode}");
    print("response for removeFromFavorites  ${response.data}");
 

    return unit;
  }
}
