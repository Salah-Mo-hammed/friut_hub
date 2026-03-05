import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/e_commerce/cart/domain/entities/cart_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, Unit>> addToCart(
    int productId,
    int quantity,
  );
  Future<Either<Failure, CartEntity>> getCartProducts();
}
