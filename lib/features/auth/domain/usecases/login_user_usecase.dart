import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/auth/domain/repo/auth_repo.dart';

class LoginUserUsecase {
  AuthRepo authRepo;
  LoginUserUsecase({required this.authRepo});

  Future<Either<Failure, Map<String, dynamic>>> call(
    String email,
    String password,
  ) {
    return authRepo.loginUser(email, password);
  }
}
