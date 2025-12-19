// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friut_hub/auth/presentation/pages/reset_pass_page.dart';
import 'package:friut_hub/features/pages/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:friut_hub/auth/presentation/pages/login_page.dart';
import 'package:friut_hub/generated/l10n.dart';

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
      // debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,

      // home: ResetPasswordPage(),
      // home: LoginPage(isRegister: false),
      home: const SplashPage(),
    );
  }
}
/*

      locale: const Locale('ar'),
      supportedLocales: const [Locale('en'), Locale('ar')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
 */