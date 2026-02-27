import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

enum FailureType {
  server,
  connection,
  unauthorized,
  forbidden,
  notFound,
  validation,
  cache,
  database,
  unknown,
}

class Failure extends Equatable {
  final String message;
  final FailureType type;
  final int? statusCode;
  final String? errorCode;
  final Map<String, dynamic>? validationErrors;

  const Failure({
    required this.message,
    required this.type,
    this.statusCode,
    this.errorCode,
    this.validationErrors,
  });

  // -------------------------------
  // Factory Constructors
  // -------------------------------

  factory Failure.server({
    required String message,
    int? statusCode,
  }) {
    return Failure(
      message: message,
      type: FailureType.server,
      statusCode: statusCode,
    );
  }

  factory Failure.connection({
    String message = "No internet connection",
  }) {
    return Failure(
      message: message,
      type: FailureType.connection,
    );
  }

  factory Failure.unauthorized({
    String message = "Session expired. Please login again.",
    int? statusCode,
  }) {
    return Failure(
      message: message,
      type: FailureType.unauthorized,
      statusCode: statusCode,
    );
  }

  factory Failure.forbidden({
    String message = "You are not allowed to perform this action.",
    int? statusCode,
  }) {
    return Failure(
      message: message,
      type: FailureType.forbidden,
      statusCode: statusCode,
    );
  }

  factory Failure.notFound({
    String message = "Resource not found.",
    int? statusCode,
  }) {
    return Failure(
      message: message,
      type: FailureType.notFound,
      statusCode: statusCode,
    );
  }

  factory Failure.validation({
    required String message,
    Map<String, dynamic>? errors,
    int? statusCode,
  }) {
    return Failure(
      message: message,
      type: FailureType.validation,
      validationErrors: errors,
      statusCode: statusCode,
    );
  }

  factory Failure.cache({
    String message = "Cache error occurred",
  }) {
    return Failure(
      message: message,
      type: FailureType.cache,
    );
  }

  factory Failure.database({
    String message = "Database error occurred",
  }) {
    return Failure(
      message: message,
      type: FailureType.database,
    );
  }

  factory Failure.unknown({
    String message = "Unexpected error occurred",
  }) {
    return Failure(
      message: message,
      type: FailureType.unknown,
    );
  }


  @override
  List<Object?> get props =>
      [message, type, statusCode, errorCode, validationErrors];
}
