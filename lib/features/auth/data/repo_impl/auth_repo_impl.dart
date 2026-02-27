// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:friut_hub/core/errors/error.dart';
import 'package:friut_hub/features/auth/data/models/user_model.dart';
import 'package:friut_hub/features/auth/data/sources/remote/auth_remote_data_source.dart';
import 'package:friut_hub/features/auth/domain/entities/user_entity.dart';
import 'package:friut_hub/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> regsterUser(
    String userName,
    String fullName,
    String email,
    String password,
  ) async {
    try {
      final UserModel userModel = await authRemoteDataSource
          .registerUser(userName, fullName, email, password);
      return Right(userModel);
    }
    //  Dio Errors (API Errors)
    on SocketException {
      return Left(Failure.connection());
    } catch (e) {
      return Left(
        Failure.unknown(
          message: "AuthRepoImpl Exceoption => ${e.toString()}",
        ),
      );
    }
  }
}
