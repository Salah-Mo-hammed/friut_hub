import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/auth/domain/repo/auth_repo.dart';

class VerifyPassOTPUserUsecase {
  AuthRepo authRepo;
  VerifyPassOTPUserUsecase({required this.authRepo});

  Future<Either<Failure, Unit>> call(
    String email,
    String otp

  ) {
    return authRepo.verifyPassOTP(email,otp);
  }
}
