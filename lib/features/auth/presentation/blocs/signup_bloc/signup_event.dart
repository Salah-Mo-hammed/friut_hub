part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {

  const SignupEvent();

}

class SignupSubmittedEvent extends SignupEvent{
  final String userName;
  final String fullName;
  final String email;
  final String password;

 const SignupSubmittedEvent({required this.userName, required this.fullName, required this.email, required this.password});
  @override
  List<Object> get props => [userName, fullName, email, password];

}
