import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/e_commerce/products/domain/entities/product_entity.dart';

abstract class FavoritesRepo {
  Future<Either<Failure, List<ProductEntity>>> getAllFavorites();
  Future<Either<Failure, Unit>> addToFavorites(int productId);
  Future<Either<Failure, Unit>> removeFromFavorites(int productId);


}
