part of 'forget_pass_bloc.dart';

sealed class ForgetPassEvent extends Equatable {
  const ForgetPassEvent();

  @override
  List<Object> get props => [];
}
class ResetPasswordEvent extends ForgetPassEvent {
  String email;
  ResetPasswordEvent({required this.email});

}

class VerifyPassOTPEvent extends ForgetPassEvent {
  String email;
  String otp;
  VerifyPassOTPEvent({required this.email, required this.otp});
  @override
  List<Object> get props => [email,otp];

}

class ChangeToNewPasswordEvent extends ForgetPassEvent {
  String resetToken;
  String newPassword;
  ChangeToNewPasswordEvent({required this.resetToken, required this.newPassword});
  @override
  List<Object> get props => [resetToken,newPassword];

}