import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';

abstract class CartRepo {
  Future<Either<Failure, Unit>> addToCart(int productId, int quantity);
}
