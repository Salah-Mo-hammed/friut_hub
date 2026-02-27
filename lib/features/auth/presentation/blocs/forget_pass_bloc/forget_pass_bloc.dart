import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:friut_hub/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:friut_hub/features/auth/domain/usecases/verify_pass_otp_usecase.dart';

part 'forget_pass_event.dart';
part 'forget_pass_state.dart';

class ForgetPassBloc extends Bloc<ForgetPassEvent, ForgetPassState> {
  final ResetPasswordUsecase resetPasswordUsecase;
  final VerifyPassOTPUserUsecase verifyPassOTPUserUsecase;
  ForgetPassBloc({
    required this.resetPasswordUsecase,
    required this.verifyPassOTPUserUsecase,
  }) : super(ForgetPassInitial()) {
    on<ResetPasswordEvent>(_onResetPassword);
    on<VerifyPassOTPEvent>(_onVerifyPassOTP);
  }

  FutureOr<void> _onResetPassword(
    ResetPasswordEvent event,
    Emitter<ForgetPassState> emit,
  ) async {
    emit(ForgetPassLoading());
    final result = await resetPasswordUsecase.call(event.email);
    result.fold(
      (failure) {
        print(failure);

        emit(ForgetPassFailure(message: "SignupFailure=> $failure "));
      },
      (unit) {
        emit(PasswordOtpSent());
      },
    );
  }

  FutureOr<void> _onVerifyPassOTP(
    VerifyPassOTPEvent event,
    Emitter<ForgetPassState> emit,
  ) async {
    emit(ForgetPassLoading());
    final result = await verifyPassOTPUserUsecase.call(
      event.email,
      event.otp,
    );
    result.fold(
      (failure) {
        print(failure);

        emit(ForgetPassFailure(message: "SignupFailure=> $failure "));
      },
      (unit) {
        emit(PasswordOtpCorrect());
      },
    );
  }
}
