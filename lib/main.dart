// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friut_hub/dependency_container.dart';
import 'package:friut_hub/features/auth/presentation/blocs/forget_pass_bloc/forget_pass_bloc.dart';
import 'package:friut_hub/features/auth/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:friut_hub/features/auth/presentation/blocs/signup_bloc/signup_bloc.dart';
import 'package:friut_hub/features/auth/presentation/pages/login_page.dart';
import 'package:friut_hub/features/e_commerce/cart/presintation/bloc/cart_bloc.dart';
import 'package:friut_hub/features/e_commerce/category/presintation/bloc/category_bloc.dart';
import 'package:friut_hub/features/e_commerce/favorites/presintation/bloc/favorites_bloc.dart';
import 'package:friut_hub/features/e_commerce/order/presintaion/bloc/order_bloc.dart';
import 'package:friut_hub/features/e_commerce/products/presintation/blocs/products_bloc/products_bloc.dart';
import 'package:friut_hub/features/e_commerce/products/presintation/blocs/product_details_bloc/product_details_bloc.dart';
import 'package:friut_hub/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:friut_hub/core/helpers/on_geenerate_routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initilaizedDependencies();

  runApp(const MyApp());
}

//! for testing  UI preview in other devices
// void main() => runApp(
//   DevicePreview(
//     enabled: !kReleaseMode,
//     builder: (context) => MyApp(), // Wrap your app
//   ),
// );
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //! ============ Auth ============
        BlocProvider<SignupBloc>(create: (_) => sl<SignupBloc>()),
        BlocProvider<LoginBloc>(create: (_) => sl<LoginBloc>()),
        BlocProvider<ForgetPassBloc>(
          create: (_) => sl<ForgetPassBloc>(),
        ),
        //! ============ Prodcut ============
        BlocProvider(create: (_) => sl<ProductsBloc>()),
        BlocProvider(create: (_) => sl<ProductDetailsBloc>()),
        //! ============ Category ============
        BlocProvider(create: (_) => sl<CategoryBloc>()),
        //! ============ Cart ============
        BlocProvider(create: (_) => sl<CartBloc>()),
        //! ============ Order ============
        BlocProvider(create: (_) => sl<OrderBloc>()),
        //! ============ Favorites ============
        BlocProvider(create: (_) => sl<FavoritesBloc>()..add(GetAllFavoritesEvent())),
      
      ],
      child: MaterialApp(
        locale: Locale('ar'),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        onGenerateRoute: onGenerateRoutes,

        initialRoute: LoginPage.routeName,
        builder:
            (context, child) => Directionality(
              textDirection: TextDirection.rtl,
              child: child!,
            ),
      ),
    );
  }
}
