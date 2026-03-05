import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/e_commerce/category/domain/entities/category_entity.dart';
import 'package:friut_hub/features/e_commerce/products/domain/entities/product_entity.dart';

abstract class CategoryRepo {

  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
  Future<Either<Failure, List<ProductEntity>>> getCategoryProducts(int categoryId);

}