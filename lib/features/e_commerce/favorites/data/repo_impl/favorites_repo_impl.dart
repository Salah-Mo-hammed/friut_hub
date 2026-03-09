// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/e_commerce/favorites/data/source/local/favorites_local_data_source.dart';
import 'package:friut_hub/features/e_commerce/favorites/data/source/remote/favorites_remote_data_source.dart';
import 'package:friut_hub/features/e_commerce/favorites/domain/repo/favorites_repo.dart';
import 'package:friut_hub/features/e_commerce/products/domain/entities/product_entity.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  FavoritesRemoteDataSource favoritesRemoteDataSource;
  FavoritesLocalDataSource favoritesLocalDataSource;
  FavoritesRepoImpl({required this.favoritesRemoteDataSource, required this.favoritesLocalDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>>
  getAllFavorites() async {
    try {
      final response =
          await favoritesRemoteDataSource.getAllFavorites();
          await favoritesLocalDataSource.clearAndInsertAll(response); // sync SQLite

      return Right(response);
    } on DioException {
      //  in case remote didnt work , we will show local ds
     final local = await favoritesLocalDataSource.fetchAllFavoritesFromLocal();
    return Right(local);
    } catch (e) {
      return Left(
        Failure.unknown(
          message: "FavouriteRepoImpl Exceoption => ${e.toString()}",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> addToFavorites(int productId) async {
    try {
      final response = await favoritesRemoteDataSource.addToFavorites(
        productId,
      );
      // after adding to favorites, we will re fetch the data from local
    final reFetch = await favoritesRemoteDataSource.getAllFavorites();
    await favoritesLocalDataSource.clearAndInsertAll(reFetch);

      return Right(response);
    } on DioException catch (e) {
      print("STATUS CODE: ${e.response?.statusCode}");
      print("RESPONSE DATA: ${e.response?.data}");
      print("RESPONSE TYPE: ${e.response?.data.runtimeType}");

      return Left(Failure.unknown(message: e.toString()));
    } catch (e) {
      return Left(
        Failure.unknown(
          message: "FavouriteRepoImpl Exceoption => ${e.toString()}",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFromFavorites(
    int productId,
  ) async {
    try {
      final response = await favoritesRemoteDataSource
          .removeFromFavorites(productId);
          await favoritesLocalDataSource.deleteFromFavorites(productId);

// ! there is no need to do this, (since what all we need is just the id)
// ! not like add to favorites, (we need the whole product entity )
    //final reFetch = await favoritesRemoteDataSource.getAllFavorites();
    // await favoritesLocalDataSource.clearAndInsertAll(reFetch);

      return Right(response);
    } on DioException catch (e) {
      print("STATUS CODE: ${e.response?.statusCode}");
      print("RESPONSE DATA: ${e.response?.data}");
      print("RESPONSE TYPE: ${e.response?.data.runtimeType}");

      return Left(Failure.unknown(message: e.toString()));
    } catch (e) {
      return Left(
        Failure.unknown(
          message: "FavouriteRepoImpl Exceoption => ${e.toString()}",
        ),
      );
    }
  }
}
