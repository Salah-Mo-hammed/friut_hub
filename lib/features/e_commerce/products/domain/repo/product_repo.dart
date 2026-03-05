import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/e_commerce/category/domain/entities/category_entity.dart';
import 'package:friut_hub/features/e_commerce/products/domain/entities/product_entity.dart';

abstract class ProductRepo {
// ! Products
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  Future<Either<Failure, List<ProductEntity>>> searchProducts(String searchQuery);
// ! Detaild Product
  Future<Either<Failure, ProductEntity>> getDetaildProduct(String id);

}
