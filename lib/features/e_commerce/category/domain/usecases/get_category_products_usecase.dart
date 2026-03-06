// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/e_commerce/category/domain/repo/category_repo.dart';
import 'package:friut_hub/features/e_commerce/products/domain/entities/product_entity.dart';

class GetCategoryProductsUsecase {
  CategoryRepo categoryRepo;
  GetCategoryProductsUsecase({required this.categoryRepo});
  Future<Either<Failure, List<ProductEntity>>> call(int categoryId) {
    return categoryRepo.getCategoryProducts(categoryId);
  }
}
