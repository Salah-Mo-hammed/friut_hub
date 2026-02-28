import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:friut_hub/features/auth/domain/usecases/change_to_new_pass_usecase.dart';
import 'package:friut_hub/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:friut_hub/features/auth/domain/usecases/verify_pass_otp_usecase.dart';

part 'forget_pass_event.dart';
part 'forget_pass_state.dart';

class ForgetPassBloc extends Bloc<ForgetPassEvent, ForgetPassState> {
  final ResetPasswordUsecase resetPasswordUsecase;
  final VerifyPassOTPUserUsecase verifyPassOTPUserUsecase;
  final ChangeToNewPassUsecase changeToNewPassUsecase;
  ForgetPassBloc({
    required this.changeToNewPassUsecase,
    required this.resetPasswordUsecase,
    required this.verifyPassOTPUserUsecase,
  }) : super(ForgetPassInitial()) {
    on<ResetPasswordEvent>(_onResetPassword);
    on<VerifyPassOTPEvent>(_onVerifyPassOTP);
    on<ChangeToNewPasswordEvent>(_onChangeToNewPassword);
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
      (data) {
        emit(PasswordOtpCorrect(resetToken: data));
      },
    );
  }

  FutureOr<void> _onChangeToNewPassword(
    ChangeToNewPasswordEvent event,
    Emitter<ForgetPassState> emit,
  ) async {
    emit(ForgetPassLoading());
    final result = await changeToNewPassUsecase.call(
      event.resetToken,
      event.newPassword,
    );
    result.fold((failure) {
              emit(ForgetPassFailure(message: "SignupFailure=> $failure "));

    }, (unit) {
              emit(PasswordChangedSucessfully());

    });
  }
}
