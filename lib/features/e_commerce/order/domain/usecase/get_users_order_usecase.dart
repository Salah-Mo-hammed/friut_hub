// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/e_commerce/order/domain/entities/order_entity.dart';
import 'package:friut_hub/features/e_commerce/order/domain/repo/order_repo.dart';

class GetUserOrdersUsecase {
  OrderRepo orderRepo;
  GetUserOrdersUsecase({required this.orderRepo});

  Future<Either<Failure, List<OrderEntity>>> call() {
    return orderRepo.getUserOrders();
  }
}
