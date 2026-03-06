// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/e_commerce/category/domain/entities/category_entity.dart';
import 'package:friut_hub/features/e_commerce/category/domain/repo/category_repo.dart';

class GetAllCategoriesUsecase {
  CategoryRepo categoryRepo;
  GetAllCategoriesUsecase({required this.categoryRepo});

  Future<Either<Failure, List<CategoryEntity>>> call() {
    return categoryRepo.getAllCategories();
  }
}
