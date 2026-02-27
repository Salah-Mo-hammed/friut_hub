import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friut_hub/features/auth/domain/usecases/login_user_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUserUsecase loginUserUsecase;
  LoginBloc({required this.loginUserUsecase})
    : super(LoginInitial()) {
    on<LoginSubmittedEvent>(_onLogin);
  }

  FutureOr<void> _onLogin(
    LoginSubmittedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    final result = await loginUserUsecase.call(
      event.email,
      event.password,
    );
    result.fold(
      (failure) {
        print(failure);

        emit(LoginFailure(message: "LoginFailure=> $failure "));
      },
      (map) {
        emit(LoginSucessful(response: map));
      },
    );
  }
}
