// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/e_commerce/order/domain/entities/create_order_param.dart';
import 'package:friut_hub/features/e_commerce/order/domain/repo/order_repo.dart';

class CreateOrderUsecase {
  OrderRepo orderRepo;
  CreateOrderUsecase({required this.orderRepo});

  Future<Either<Failure, Unit>> call(
    CreateOrderParamEntity orderParams,
  ) {
    return orderRepo.createOrder(orderParams);
  }
}
