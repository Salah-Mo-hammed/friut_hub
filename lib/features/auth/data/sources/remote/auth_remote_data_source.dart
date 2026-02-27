import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:friut_hub/core/endpoints/endpoints.dart';
import 'package:friut_hub/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> registerUser(
    String userName,
    String fullName,
    String email,
    String password,
  );
  Future<Unit> sendEmailConfirmCode(String email);
  Future<Unit> verifyEmailOTP(String email,String otp);

}

class AuthDsWithDio implements AuthRemoteDataSource {
  final Dio dio;

  AuthDsWithDio({required this.dio});

  /*   @override
  Future<UserModel> registerUser(
    String userName,
    String fullName,
    String email,
    String password,
  ) async {
    print("hello inWithDIO");
    final response = await dio.post(
      "/api/Users",
      data: {
        "userName": userName,
        "fullName": fullName,
        "email": email,
        "password": password,
      },
    );

    print("===== DEBUG START =====");
    print("STATUS: ${response.statusCode}");
    print("HEADERS: ${response.headers}");
    print("DATA TYPE: ${response.data.runtimeType}");
    print("DATA: ${response.data}");
    print("===== DEBUG END =====");
    if (response.data is String) {
      final decoded = jsonDecode(response.data);
      return UserModel.fromJson(decoded);
    }

    return UserModel.fromJson(response.data);
  }
 */
  @override
  Future<UserModel> registerUser(
    String userName,
    String fullName,
    String email,
    String password,
  ) async {
    print({
      "userName": userName,
      "fullName": fullName,
      "email": email,
      "password": password,
    });
    final response = await dio.post(
      Endpoints.registerUser,
      data: {
        "userName": userName,
        "fullName": fullName,
        "email": email,
        "password": password,
      },
    );
    print(response.data);
    return UserModel.fromJson(
      response.data is String
          ? jsonDecode(response.data)
          : response.data,
    );
  }

  @override
  Future<Unit> sendEmailConfirmCode(String email) async {
    final response = await dio.post(
      Endpoints.emailConfirmation,
      data: {"email": email},
    );
    print("response for sending email code ${response.statusCode}");

    return unit;
  }
  
  @override
  Future<Unit> verifyEmailOTP(String email, String otp) async{
    final response = await dio.put(
      Endpoints.emailConfirmation,
      data: {"email": email, 'otp':otp},
    );
    print("response for checking email code ${response.statusCode}");
    return unit;
  }
}
