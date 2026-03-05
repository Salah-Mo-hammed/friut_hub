// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/e_commerce/cart/domain/entities/cart_entity.dart';
import 'package:friut_hub/features/e_commerce/cart/domain/repo/cart_repo.dart';

class GetCartProductsUsecase {
  CartRepo cartRepo;
  GetCartProductsUsecase({required this.cartRepo});

  Future<Either<Failure, CartEntity>> call() {
    return cartRepo.getCartProducts();
  }
}
