// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/e_commerce/cart/data/source/cart_remote_data_source.dart';
import 'package:friut_hub/features/e_commerce/cart/domain/repo/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  CartRemoteDataSource cartRemoteDataSource;
  CartRepoImpl({
    required this.cartRemoteDataSource,
  });
  
  @override
  Future<Either<Failure, Unit>> addToCart(int productId,int quantity) async{
    try {
       await cartRemoteDataSource.addToCart(productId,quantity);
      return Right(unit);
    } on DioException catch (e) {
      print("STATUS CODE: ${e.response?.statusCode}");
      print("RESPONSE DATA: ${e.response?.data}");
      print("RESPONSE TYPE: ${e.response?.data.runtimeType}");

      return Left(Failure.unknown(message: e.toString()));
    } catch (e) {
      return Left(
        Failure.unknown(
          message: "CartRepoImpl Exceoption => ${e.toString()}",
        ),
      );
    }
    
  }
}
