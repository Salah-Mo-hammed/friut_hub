import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friut_hub/features/auth/domain/usecases/login_user_usecase.dart';
import 'package:friut_hub/features/auth/domain/usecases/logout_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUserUsecase loginUserUsecase;
  LogoutUsecase logoutUsecase;
  LoginBloc({
    required this.loginUserUsecase,
    required this.logoutUsecase,
  }) : super(LoginInitial()) {
    on<LoginSubmittedEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
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
        emit(LoginSucessful(loggedUserData: map));
      },
    );
  }

  FutureOr<void> _onLogout(LogoutEvent event, Emitter<LoginState> emit) async{
    
    emit(LoginLoading());
    final result = await logoutUsecase.call(
    );
    result.fold(
      (failure) {
        print(failure);

        emit(LoginFailure(message: "LoginFailure=> $failure "));
      },
      (unit) {
        emit(LoginInitial());
      },
    );
  }
}
