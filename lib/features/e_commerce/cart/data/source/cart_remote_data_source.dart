// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:friut_hub/core/endpoints/endpoints.dart';
import 'package:friut_hub/features/e_commerce/cart/data/models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<Unit> addToCart(int productId, int quantity);
  Future<CartModel> getCartProducts();
}

class CartDsWithDio implements CartRemoteDataSource {
  final Dio dio;
  CartDsWithDio({required this.dio});
  @override
  Future<Unit> addToCart(int productId, int quantity) async {
    // final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('access_token');
    final response = await dio.post(
      "${Endpoints.addToCart}/$productId",
      data: {"quantity": quantity},
    );
    print("status code for adding to Cart: ${response.statusCode}");
    print("getting the prodcuts ${response.data}");

    return unit;
  }

  @override
  Future<CartModel> getCartProducts() async {
    final response = await dio.get(Endpoints.addToCart);
    print("status code for adding to Cart: ${response.statusCode}");
    print("getting the prodcuts ${response.data}");
    final items = CartModel.fromJson(response.data);
    return items;
  }
}
