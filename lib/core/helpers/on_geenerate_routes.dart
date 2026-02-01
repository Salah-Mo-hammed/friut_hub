import 'package:flutter/material.dart';
import 'package:friut_hub/core/pages/on_boarding_view.dart';
import 'package:friut_hub/core/pages/splash_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/fprget_pass_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/login_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/pass_recovery_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/reset_pass_page.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/main_dashboard.dart';

Route<dynamic> OnGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashPage.routeName:
      return MaterialPageRoute(builder: (_) => SplashPage());

    case OnBoardingView.routeName:
      return MaterialPageRoute(
        builder: (_) => OnBoardingView(),
      );

    case LoginPage.routeName:
      final args = settings.arguments as bool? ?? false;
      return MaterialPageRoute(
        builder: (_) => LoginPage(isRegister: args),
      );
          case ForgetPasswordPage.routeName:
      return MaterialPageRoute(builder: (_) => ForgetPasswordPage());

          case PasswoedRecoveryPage.routeName:
      return MaterialPageRoute(builder: (_) => PasswoedRecoveryPage());


case ResetPasswordPage.routeName:
      return MaterialPageRoute(builder: (_) => ResetPasswordPage());
    case MainDashboard.routeName:
      return MaterialPageRoute(builder: (_) => MainDashboard());

    // ! this must change later
    default:
      return MaterialPageRoute(builder: (context) => SplashPage());
  }
}
