import 'package:dio/dio.dart';
import 'package:friut_hub/core/endpoints/endpoints.dart';
import 'package:friut_hub/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:friut_hub/features/auth/data/sources/remote/auth_remote_data_source.dart';
import 'package:friut_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:friut_hub/features/auth/domain/usecases/change_to_new_pass_usecase.dart';
import 'package:friut_hub/features/auth/domain/usecases/login_user_usecase.dart';
import 'package:friut_hub/features/auth/domain/usecases/register_user_usecase.dart';
import 'package:friut_hub/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:friut_hub/features/auth/domain/usecases/send_email_confirm_code_usecase.dart';
import 'package:friut_hub/features/auth/domain/usecases/verify_email_usecase.dart';
import 'package:friut_hub/features/auth/domain/usecases/verify_pass_otp_usecase.dart';
import 'package:friut_hub/features/auth/presentation/blocs/forget_pass_bloc/forget_pass_bloc.dart';
import 'package:friut_hub/features/auth/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:friut_hub/features/auth/presentation/blocs/signup_bloc/signup_bloc.dart';
import 'package:friut_hub/features/e_commerce/products/data/repo_impl/product_repo_impl.dart';
import 'package:friut_hub/features/e_commerce/products/data/source/product_remote_data_source.dart';
import 'package:friut_hub/features/e_commerce/products/domain/repo/product_repo.dart';
import 'package:friut_hub/features/e_commerce/products/domain/usecases/get_all_products_usecase.dart';
import 'package:friut_hub/features/e_commerce/products/domain/usecases/get_detaild_product_usecase.dart';
import 'package:friut_hub/features/e_commerce/products/domain/usecases/search_prodcuts_usecase.dart';
import 'package:friut_hub/features/e_commerce/products/presintation/blocs/products_bloc/products_bloc.dart';
import 'package:friut_hub/features/e_commerce/products/presintation/blocs/product_details_bloc/product_details_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> initilaizedDependencies() async {
  //! Dio
  sl.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
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
  sl.registerSingleton<ProductRemoteDataSource>(
    ProductDsWithDio(dio: sl<Dio>()),
  );

  //! domain-> repo
  sl.registerSingleton<AuthRepo>(
    AuthRepoImpl(authRemoteDataSource: sl<AuthRemoteDataSource>()),
  );
  sl.registerSingleton<ProductRepo>(
    ProductRepoImpl(
      productRemoteDataSource: sl<ProductRemoteDataSource>(),
    ),
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
  sl.registerSingleton<ChangeToNewPassUsecase>(
    ChangeToNewPassUsecase(authRepo: sl<AuthRepo>()),
  );
  sl.registerSingleton<LoginUserUsecase>(
    LoginUserUsecase(authRepo: sl<AuthRepo>()),
  );

  //! ============= Products =============
  sl.registerSingleton<GetAllProductsUsecase>(
    GetAllProductsUsecase(productRepo: sl<ProductRepo>()),
  );
  sl.registerSingleton<SearchProdcutsUsecase>(
    SearchProdcutsUsecase(productRepo: sl<ProductRepo>()),
  );
  sl.registerSingleton<GetDetaildProductUsecase>(
    GetDetaildProductUsecase(productRepo: sl<ProductRepo>()),
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
      changeToNewPassUsecase: sl<ChangeToNewPassUsecase>(),
    ),
  );
  //! ============= Products =============
  sl.registerFactory<ProductsBloc>(
    () => ProductsBloc(
      getAllProductsUsecase: sl<GetAllProductsUsecase>(),
      searchProdcutsUsecase: sl<SearchProdcutsUsecase>(),
    ),
  );
  sl.registerFactory<ProductDetailsBloc>(
    () => ProductDetailsBloc(
      getDetaildProductUsecase: sl<GetDetaildProductUsecase>(),
    ),
  );
}
