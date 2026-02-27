part of 'forget_pass_bloc.dart';

sealed class ForgetPassState extends Equatable {
  const ForgetPassState();

  @override
  List<Object> get props => [];
}

final class ForgetPassInitial extends ForgetPassState {}
final class PasswordOtpSent extends ForgetPassState {}
final class PasswordOtpCorrect extends ForgetPassState {}

final class PasswordResetedSucessfully extends ForgetPassState {}
final class ForgetPassLoading extends ForgetPassState {}
final class ForgetPassFailure extends ForgetPassState {
    final String message;

 const ForgetPassFailure({required this.message});

}
