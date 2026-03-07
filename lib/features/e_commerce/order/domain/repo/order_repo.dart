import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/e_commerce/order/domain/entities/create_order_param.dart';
import 'package:friut_hub/features/e_commerce/order/domain/entities/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, Unit>> createOrder(CreateOrderParamEntity orderParams);
  Future<Either<Failure, List<OrderEntity>>> getUserOrders();

}
