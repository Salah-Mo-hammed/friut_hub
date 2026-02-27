import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/auth/domain/entities/user_entity.dart';
import 'package:friut_hub/features/auth/domain/repo/auth_repo.dart';

class RegisterUserUsecase {
  AuthRepo authRepo;
  RegisterUserUsecase({required this.authRepo});

  Future<Either<Failure, UserEntity>> call(
    String userName,
    String fullName,
    String email,
    String password,
  ) {
    return authRepo.regsterUser(userName, fullName, email, password);
  }
}
