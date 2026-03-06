// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/e_commerce/cart/domain/repo/cart_repo.dart';

class UpdatePeoductQuantityInCartUsecase {
  CartRepo cartRepo;
  UpdatePeoductQuantityInCartUsecase({required this.cartRepo});

  Future<Either<Failure, Unit>> call(int productId,int quantity) {
    return cartRepo.updateProductQuantityInCart(productId,quantity);
  }
}
