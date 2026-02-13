// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friut_hub/features/auth/presentation/pages/login_page.dart';
import 'package:friut_hub/core/helpers/on_geenerate_routes.dart';
// import 'package:friut_hub/e_commerce/presintaion/pages/home_page.dart';
// import 'package:friut_hub/auth/presentation/pages/reset_pass_page.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/item_details_page.dart';
// import 'package:friut_hub/e_commerce/presintaion/pages/main_dashboard.dart';
// import 'package:friut_hub/features/pages/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/main_dashboard.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/reviews_page.dart';
import 'package:friut_hub/core/pages/on_boarding_view.dart';
import 'package:friut_hub/core/pages/splash_page.dart';
// import 'package:friut_hub/auth/presentation/pages/login_page.dart';
import 'package:friut_hub/generated/l10n.dart';

// asdjk asdj
void main() {
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
    return MaterialApp(
      locale: Locale('ar'),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,

   
      onGenerateRoute: OnGenerateRoutes,
      initialRoute: SplashPage.routeName,
   
    );
  }
}
