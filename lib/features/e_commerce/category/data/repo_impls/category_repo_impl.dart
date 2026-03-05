// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/e_commerce/category/data/source/category_remote_data_source.dart';
import 'package:friut_hub/features/e_commerce/category/domain/entities/category_entity.dart';
import 'package:friut_hub/features/e_commerce/category/domain/repo/category_repo.dart';
import 'package:friut_hub/features/e_commerce/products/domain/entities/product_entity.dart';

class CategoryRepoImpl implements CategoryRepo {
  CategoryRemoteDataSource categoryRemoteDataSource;
  CategoryRepoImpl({
    required this.categoryRemoteDataSource,
  });
  

  @override
  Future<Either<Failure, List<CategoryEntity>>>
  getAllCategories() async {
    try {
      final categories =
          await categoryRemoteDataSource.getAllCategories();
      return Right(categories);
    } on DioException catch (e) {
      print("STATUS CODE: ${e.response?.statusCode}");
      print("RESPONSE DATA: ${e.response?.data}");
      print("RESPONSE TYPE: ${e.response?.data.runtimeType}");

      return Left(Failure.unknown(message: e.toString()));
    } catch (e) {
      return Left(
        Failure.unknown(
          message: "ProductRepoImpl Exceoption => ${e.toString()}",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getCategoryProducts(
    int id,
  ) async {
    try {
      final products = await categoryRemoteDataSource
          .getCategoryProducts(id);
      return Right(products);
    } on DioException catch (e) {
      print("STATUS CODE: ${e.response?.statusCode}");
      print("RESPONSE DATA: ${e.response?.data}");
      print("RESPONSE TYPE: ${e.response?.data.runtimeType}");

      return Left(Failure.unknown(message: e.toString()));
    } catch (e) {
      return Left(
        Failure.unknown(
          message: "ProductRepoImpl Exceoption => ${e.toString()}",
        ),
      );
    }
  }
}
