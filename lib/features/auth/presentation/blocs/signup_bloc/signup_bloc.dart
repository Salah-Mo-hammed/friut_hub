import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friut_hub/features/auth/domain/usecases/register_user_usecase.dart';
import 'package:friut_hub/features/auth/domain/usecases/send_email_confirm_code_usecase.dart';
import 'package:friut_hub/features/auth/domain/usecases/verify_email_usecase.dart';
import 'package:friut_hub/features/auth/presentation/blocs/signup_bloc/signup_state.dart';

part 'signup_event.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final RegisterUserUsecase registerUserUsecase;
  final SendEmailConfirmationUserUsecase
  sendEmailConfirmationUserUsecase;
  final VerifyEmailUserUsecase verifyEmailUserUsecase;
  SignupBloc({
    required this.registerUserUsecase,
    required this.sendEmailConfirmationUserUsecase,
    required this.verifyEmailUserUsecase,
  }) : super(SignupInitial()) {
    on<SignupSubmittedEvent>(_onSignUp);
    on<sendEmailConfirmationCodeEvent>(_onSendEmailVerificationCode);
    on<VerifyEmailOTPEvent>(_onVerifyEmailOTP);
  }

  FutureOr<void> _onSignUp(
    SignupSubmittedEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());
    final result = await registerUserUsecase.call(
      event.userName,
      event.fullName,
      event.email,
      event.password,
    );
    result.fold(
      (faliure) {
        print(faliure);

        emit(SignupFailure(message: "SignupFailure=> $faliure "));
      },
      (userEntity) {
        emit(SignupSucsses(user: userEntity));
      },
    );
  }

  FutureOr<void> _onSendEmailVerificationCode(
    sendEmailConfirmationCodeEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());
    final result = await sendEmailConfirmationUserUsecase.call(
      event.email,
    );
    result.fold(
      (failure) {
        print(failure);

        emit(SignupFailure(message: "SignupFailure=> $failure "));
      },
      (unit) {
        emit(SignupInitial());
      },
    );
  }

  FutureOr<void> _onVerifyEmailOTP(
    VerifyEmailOTPEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());
    final result = await verifyEmailUserUsecase.call(
      event.email,
      event.otp,
    );
    result.fold(
      (failure) {
        print(failure);

        emit(SignupFailure(message: "SignupFailure=> $failure "));
      },
      (unit) {
        emit(EmailVerifiedSucessfully());
      },
    );
  }


}
