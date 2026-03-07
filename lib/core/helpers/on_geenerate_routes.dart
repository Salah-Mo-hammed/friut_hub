import 'package:flutter/material.dart';
import 'package:friut_hub/core/pages/on_boarding_view.dart';
import 'package:friut_hub/core/pages/splash_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/fprget_pass_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/login_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/pass_recovery_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/polices_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/reset_pass_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/about_us_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/best_sellings_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/checkout_page_view.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/done_pay_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/favoutires_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/item_details_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/language_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/main_dashboard.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/my_requests_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/notifications_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/payments_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/personal_file_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/reviews_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/track_order_page.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
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
      final args = settings.arguments as Map<String, dynamic>;

      final bool isForEmailConfirmation =
          args["isForEmailConfirmation"] as bool;

      final String email = args["email"] as String;
      return MaterialPageRoute(
        builder:
            (_) => PasswoedRecoveryPage(
              isForEmailConfirmation: isForEmailConfirmation,
              email: email,
            ),
      );
    case PolicesPage.routeName:
      return MaterialPageRoute(builder: (_) => PolicesPage());
    case ReviewsPage.routeName:
      return MaterialPageRoute(builder: (_) => ReviewsPage());

    case PersonalProfilePage.routeName:
      return MaterialPageRoute(builder: (_) => PersonalProfilePage());

    case MyRequestsPage.routeName:
      return MaterialPageRoute(builder: (_) => MyRequestsPage());
    case PaymentsPage.routeName:
      return MaterialPageRoute(builder: (_) => PaymentsPage());

    case FavoutiresPage.routeName:
      return MaterialPageRoute(builder: (_) => FavoutiresPage());

    case LanguagePage.routeName:
      return MaterialPageRoute(builder: (_) => LanguagePage());

    case AboutUsPage.routeName:
      return MaterialPageRoute(builder: (_) => AboutUsPage());

    // case AddPaymentFromProfile.routeName:
    // return MaterialPageRoute(builder: (_) => AboutUsPage());

    case ResetPasswordPage.routeName:
      final args = settings.arguments as Map<String, dynamic>;
      final resetToken = args['resetToken'];
      return MaterialPageRoute(
        builder: (_) => ResetPasswordPage(resetToken: resetToken),
      );
    case MainDashboard.routeName:
      final args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (_) => MainDashboard(userData: args),
      );
    case BestSellingsPage.routeName:
      return MaterialPageRoute(builder: (_) => BestSellingsPage());
    // case BestSellingsPage.routeName:
    // return MaterialPageRoute(
    //   builder: (context) => BlocProvider.value(
    //     value: BlocProvider.of<ProductsBloc>(context),
    //     child: const BestSellingsPage(),
    //   ),
    // );
    case ItemDetailsPage.routeName:
      return MaterialPageRoute(builder: (_) => ItemDetailsPage());
    case NotificationsPage.routeName:
      return MaterialPageRoute(builder: (_) => NotificationsPage());
    case CheckoutPage.routeName:
      final args = settings.arguments as double;
      return MaterialPageRoute(
        builder: (_) => CheckoutPage(totalPrice: args),
      );

    case DonePayPage.routeName:
      return MaterialPageRoute(builder: (_) => DonePayPage());
    case TrackOrderPage.routeName:
      return MaterialPageRoute(builder: (_) => TrackOrderPage());
    // ! this must change later
    default:
      return MaterialPageRoute(builder: (context) => SplashPage());
  }
}
