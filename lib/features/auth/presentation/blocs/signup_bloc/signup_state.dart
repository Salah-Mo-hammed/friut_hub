import 'package:equatable/equatable.dart';
import 'package:friut_hub/features/auth/domain/entities/user_entity.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSucsses extends SignupState {
  final UserEntity user;

  const SignupSucsses({required this.user});
  
  
  @override
  List<Object> get props => [user];
}

final class SignupFailure extends SignupState {
  final String message;

  const SignupFailure({required this.message});

  @override
  List<Object> get props => [message];
}
