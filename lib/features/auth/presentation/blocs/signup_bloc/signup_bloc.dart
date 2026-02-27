import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:friut_hub/features/auth/domain/usecases/register_user_usecase.dart';
import 'package:friut_hub/features/auth/presentation/blocs/signup_bloc/signup_state.dart';

part 'signup_event.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final RegisterUserUsecase registerUserUsecase;
  SignupBloc({required this.registerUserUsecase})
    : super(SignupInitial()) {
    on<SignupSubmittedEvent>(_onSignUp);
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
}
