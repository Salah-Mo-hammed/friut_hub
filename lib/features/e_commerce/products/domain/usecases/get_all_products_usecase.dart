// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/e_commerce/products/domain/entities/product_entity.dart';
import 'package:friut_hub/features/e_commerce/products/domain/repo/product_repo.dart';

class GetAllProductsUsecase {
  ProductRepo productRepo;
  GetAllProductsUsecase({required this.productRepo});
  Future<Either<Failure, List<ProductEntity>>> call() {
    return productRepo.getAllProducts();
  }
}
