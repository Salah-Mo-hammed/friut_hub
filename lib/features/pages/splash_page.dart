import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/features/pages/on_boarding_view.dart';
import 'package:friut_hub/generated/assets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  double _circlesOpacity = 0.0;
  double _plantOpacity = 0.0;
  double _logoOpacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Step 1: show circles after 0.5 sec
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => _circlesOpacity = 1.0);

      // Step 2: show plant after 2 seconds
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _plantOpacity = 1.0);

        // Step 3: show logo after 2 more seconds
        Future.delayed(const Duration(seconds: 2), () {
          setState(() => _logoOpacity = 1.0); // fade in logo

          // Step 4: keep logo visible for 3 seconds
          Future.delayed(const Duration(seconds: 3), () {
            setState(() {
              _logoOpacity = 0.0;
              _circlesOpacity = 0.0;
              _plantOpacity = 0.0;
            }); // fade out logo

            // Step 5: wait for fade-out duration (1 second) then navigate
            Future.delayed(const Duration(seconds: 1), () {
              _moveOn();
            });
          });
        });
      });
    });
  }

  void _moveOn() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnBoardingView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Circles
          Positioned(
            bottom: 40,
            right: 30,
            child: FadeInRight(
              duration: const Duration(seconds: 1),
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _circlesOpacity,
                child: SizedBox(
                  // w 379 , h 156
                  width: 379.w(context),
                  height: 156.h(context),
                  child: Image.asset(
                    Assets.pngFreepikCirclesInject5Onboarding,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),

          // Plant
          Positioned(
            top: 20,
            left: 1,
            child: FadeInLeft(
              duration: const Duration(seconds: 1),
              delay: const Duration(seconds: 2),
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _plantOpacity,
                child: SizedBox(
                  // plant w 172.12 , h 192
                  width: 172.12.w(context),
                  height: 192.h(context),
                  child: Image.asset(
                    Assets.pngFreepikPlantInject63Onboarding,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),

          // fruit Logo
          Center(
            child: FadeIn(
              duration: const Duration(seconds: 1),
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _logoOpacity,
                child: SizedBox(
                  // logo W:178 , H: 173
                  width: 178.w(context),
                  height: 173.h(context),
                  child: Image.asset(
                    Assets.pngFruitHubOnboarding,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
