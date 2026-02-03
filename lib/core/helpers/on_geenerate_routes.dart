import 'package:flutter/material.dart';
import 'package:friut_hub/core/pages/on_boarding_view.dart';
import 'package:friut_hub/core/pages/splash_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/fprget_pass_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/login_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/pass_recovery_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/polices_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/reset_pass_page.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/best_sellings_page.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/checkout_page_view.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/item_details_page.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/main_dashboard.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/notifications_page.dart';

Route<dynamic> OnGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashPage.routeName:
      return MaterialPageRoute(builder: (_) => SplashPage());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => OnBoardingView());

    case LoginPage.routeName:
      final args = settings.arguments as bool? ?? false;
      return MaterialPageRoute(
        builder: (_) => LoginPage(isRegister: args),
      );
    case ForgetPasswordPage.routeName:
      return MaterialPageRoute(builder: (_) => ForgetPasswordPage());

    case PasswoedRecoveryPage.routeName:
      return MaterialPageRoute(
        builder: (_) => PasswoedRecoveryPage(),
      );
    case PolicesPage.routeName:
      return MaterialPageRoute(builder: (_) => PolicesPage());

    case ResetPasswordPage.routeName:
      return MaterialPageRoute(builder: (_) => ResetPasswordPage());
    case MainDashboard.routeName:
      return MaterialPageRoute(builder: (_) => MainDashboard());
    case BestSellingsPage.routeName:
      return MaterialPageRoute(builder: (_) => BestSellingsPage());
    case ItemDetailsPage.routeName:
      return MaterialPageRoute(builder: (_) => ItemDetailsPage());
    case NotificationsPage.routeName:
      return MaterialPageRoute(builder: (_) => NotificationsPage());
    case CheckoutPage.routeName:
      return MaterialPageRoute(builder: (_) => CheckoutPage());

    // ! this must change later
    default:
      return MaterialPageRoute(builder: (context) => SplashPage());
  }
}
