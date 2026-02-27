import 'package:dio/dio.dart';
import 'package:friut_hub/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:friut_hub/features/auth/data/sources/remote/auth_remote_data_source.dart';
import 'package:friut_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:friut_hub/features/auth/domain/usecases/login_user_usecase.dart';
import 'package:friut_hub/features/auth/domain/usecases/register_user_usecase.dart';
import 'package:friut_hub/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:friut_hub/features/auth/domain/usecases/send_email_confirm_code_usecase.dart';
import 'package:friut_hub/features/auth/domain/usecases/verify_email_usecase.dart';
import 'package:friut_hub/features/auth/domain/usecases/verify_pass_otp_usecase.dart';
import 'package:friut_hub/features/auth/presentation/blocs/forget_pass_bloc/forget_pass_bloc.dart';
import 'package:friut_hub/features/auth/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:friut_hub/features/auth/presentation/blocs/signup_bloc/signup_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> initilaizedDependencies() async {
  //! Dio
  sl.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: "http://127.0.0.1:8080",
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {"Content-Type": "application/json"},
      ),
    ),
  );

  //! data-> data sources

  sl.registerSingleton<AuthRemoteDataSource>(
    AuthDsWithDio(dio: sl<Dio>()),
  );

  //! domain-> repo
  sl.registerSingleton<AuthRepo>(
    AuthRepoImpl(authRemoteDataSource: sl<AuthRemoteDataSource>()),
  );

  //! domain-> usecases
  //! ============= AUTH  Register =============
  sl.registerSingleton<RegisterUserUsecase>(
    RegisterUserUsecase(authRepo: sl<AuthRepo>()),
  );
  sl.registerSingleton<SendEmailConfirmationUserUsecase>(
    SendEmailConfirmationUserUsecase(authRepo: sl<AuthRepo>()),
  );
  sl.registerSingleton<VerifyEmailUserUsecase>(
    VerifyEmailUserUsecase(authRepo: sl<AuthRepo>()),
  );
  sl.registerSingleton<ResetPasswordUsecase>(
    ResetPasswordUsecase(authRepo: sl<AuthRepo>()),
  );
  sl.registerSingleton<VerifyPassOTPUserUsecase>(
    VerifyPassOTPUserUsecase(authRepo: sl<AuthRepo>()),
  );

  //! ============= AUTH  Login =============
  sl.registerSingleton<LoginUserUsecase>(
    LoginUserUsecase(authRepo: sl<AuthRepo>()),
  );
  //! blocs
  //! ============= AUTH =============
  sl.registerFactory<SignupBloc>(
    () => SignupBloc(
      registerUserUsecase: sl<RegisterUserUsecase>(),
      sendEmailConfirmationUserUsecase:
          sl<SendEmailConfirmationUserUsecase>(),
      verifyEmailUserUsecase: sl<VerifyEmailUserUsecase>(),
    ),
  );
  sl.registerFactory<LoginBloc>(
    () => LoginBloc(loginUserUsecase: sl<LoginUserUsecase>()),
  );
  sl.registerFactory<ForgetPassBloc>(
    () => ForgetPassBloc(
      resetPasswordUsecase: sl<ResetPasswordUsecase>(),
      verifyPassOTPUserUsecase: sl<VerifyPassOTPUserUsecase>(),
    ),
  );

  // resetPasswordUsecase: sl<ResetPasswordUsecase>(),
}
