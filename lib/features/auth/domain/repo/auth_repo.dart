import 'package:dartz/dartz.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> regsterUser(
    String userName,
    String fullName,
    String email,
    String password,
  );
  Future<Either<Failure, Unit>> sendEmailConfirmCode(String email);
  Future<Either<Failure, Unit>> verifyEmailOTP(
    String email,
    String otp,
  );
  Future<Either<Failure, Map<String, dynamic>>> loginUser(
    String email,
    String password,
  );
    Future<Either<Failure, Unit>> resetPassword(String email);
  Future<Either<Failure, Unit>> verifyPassOTP(
    String email,
    String otp,
  );
}
