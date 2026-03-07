// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/auth/domain/repo/auth_repo.dart';

class UpdateUserNameUsecase {
  AuthRepo authRepo;
  UpdateUserNameUsecase({required this.authRepo});

  Future<Either<Failure, Unit>> call(String newName) {
    return authRepo.updateUserName(newName);
  }
}
