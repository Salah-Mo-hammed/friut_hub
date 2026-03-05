// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/e_commerce/products/data/source/product_remote_data_source.dart';
import 'package:friut_hub/features/e_commerce/category/domain/entities/category_entity.dart';
import 'package:friut_hub/features/e_commerce/products/domain/entities/product_entity.dart';
import 'package:friut_hub/features/e_commerce/products/domain/repo/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  ProductRemoteDataSource productRemoteDataSource;
  ProductRepoImpl({required this.productRemoteDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>>
  getAllProducts() async {
    try {
      final products = await productRemoteDataSource.getAllProducts();
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

  @override
  Future<Either<Failure, ProductEntity>> getDetaildProduct(
    String id,
  ) async {
    try {
      final detaildProduct = await productRemoteDataSource
          .getDetaildProduct(id);
      return Right(detaildProduct);
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
  Future<Either<Failure, List<ProductEntity>>> searchProducts(
    String searchQuery,
  ) async {
    try {
      final products = await productRemoteDataSource.searchProducts(
        searchQuery,
      );
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
