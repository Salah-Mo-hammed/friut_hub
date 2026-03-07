// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/e_commerce/order/data/source/order_remote_data_source.dart';
import 'package:friut_hub/features/e_commerce/order/domain/entities/create_order_param.dart';
import 'package:friut_hub/features/e_commerce/order/domain/repo/order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  OrderRemoteDataSource orderRemoteDataSource;
  OrderRepoImpl({
    required this.orderRemoteDataSource,
  });
  @override
  Future<Either<Failure, Unit>> createOrder(
    CreateOrderParamEntity orderParams,
  ) async{
        try {
      await orderRemoteDataSource.createOrder(orderParams);
      return Right(unit);
    } on DioException catch (e) {
      print("STATUS CODE: ${e.response?.statusCode}");
      print("RESPONSE DATA: ${e.response?.data}");
      print("RESPONSE TYPE: ${e.response?.data.runtimeType}");

      return Left(Failure.unknown(message: e.toString()));
    } catch (e) {
      return Left(
        Failure.unknown(
          message: "OrderRepoImpl Exceoption => ${e.toString()}",
        ),
      );
    }
  }
}
