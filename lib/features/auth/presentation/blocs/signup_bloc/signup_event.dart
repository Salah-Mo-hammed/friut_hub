// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();
}

class SignupSubmittedEvent extends SignupEvent {
  final String userName;
  final String fullName;
  final String email;
  final String password;

  const SignupSubmittedEvent({
    required this.userName,
    required this.fullName,
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [userName, fullName, email, password];
}

class sendEmailConfirmationCodeEvent extends SignupEvent {
  String email;
  sendEmailConfirmationCodeEvent({required this.email});

  @override
  List<Object?> get props => [];
}

class VerifyEmailOTPEvent extends SignupEvent {
  String email;
  String otp;
  VerifyEmailOTPEvent({required this.email, required this.otp});
  @override
  List<Object?> get props => [email, otp];
}
