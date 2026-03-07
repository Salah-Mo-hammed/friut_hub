part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginSubmittedEvent extends LoginEvent {
  String email;
  String password;
  LoginSubmittedEvent({required this.email, required this.password});
}

class LogoutEvent extends LoginEvent {
  const LogoutEvent();
}

class UpdateNameEvent extends LoginEvent {
  final String newName;
  const UpdateNameEvent({required this.newName});
}
