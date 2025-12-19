import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/auth/presentation/pages/login_page.dart';

class OnBoardingWidget extends StatelessWidget {
  final bool isOnBoarding1;
  final String logoImagePath;
  final String backgroundImagePath;

  const OnBoardingWidget({
    super.key,
    required this.isOnBoarding1,
    required this.logoImagePath,
    required this.backgroundImagePath,
  });
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Use a Stack only for positioned elements (orange + logo)
            SizedBox(
              height: 475,
              width: double.infinity,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Orange shape
                  Positioned.fill(
                    child: FadeInDownBig(
                      duration: const Duration(seconds: 1),
                      delay: const Duration(seconds: 2),
                      child: SizedBox(
                        // ! change their end
                        // width: 450,
                        // height: 450,
                        child: Image.asset(
                          backgroundImagePath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  // Logo
                  Positioned(
                    top: 250,
                    left: 110,
                    child: FadeIn(
                      duration: const Duration(seconds: 1),
                      delay: const Duration(milliseconds: 2500),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset(
                          logoImagePath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Text below logo
            FadeIn(
              duration: const Duration(seconds: 2),
              delay: const Duration(milliseconds: 3500),
              child:
                  isOnBoarding1
                      ? RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                          ),
                          children: [
                            TextSpan(
                              text: 'مرحبا بك في ',
                              style: const TextStyle(
                                color: Color(0xFF0C0D0D),
                              ),
                            ),
                            TextSpan(
                              text: 'Fruit',
                              style: const TextStyle(
                                color: Color(0xFF1B5E37),
                              ),
                            ),
                            TextSpan(
                              text: 'Hub',
                              style: const TextStyle(
                                color: Color(0xFFF4A91F),
                              ),
                            ),
                          ],
                        ),
                      )
                      : Text("ابحث وتسوق", style: AppTextStyles.h5),
            ),
            const SizedBox(height: 10),
            FadeIn(
              duration: const Duration(seconds: 2),
              delay: const Duration(milliseconds: 3500),
              child: Text(
                isOnBoarding1
                    ? "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف\n مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل\n على أفضل العروض والجودة العالية."
                    : "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Color(0xFF0C0D0D),
                ),
              ),
            ),
            const SizedBox(height: 90),

            // Continue button
            if (!isOnBoarding1)
              FadeIn(
                duration: const Duration(seconds: 2),
                delay: const Duration(milliseconds: 3500),
                child: MyButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => LoginPage(isRegister: false),
                      ),
                    );
                  },
                  buttonTitle: "ابدأ الان",
                ),
              ),
          ],
        ),
      ),
    );
  }
}
