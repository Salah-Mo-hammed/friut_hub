import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/auth/domain/repo/auth_repo.dart';

class ResetPasswordUsecase {
  AuthRepo authRepo;
  ResetPasswordUsecase({required this.authRepo});

  Future<Either<Failure, Unit>> call(String email) {
    return authRepo.sendresetPasswordCode(email);
  }
}
