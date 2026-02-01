import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/widgets/on_boarding_widget.dart';
import 'package:friut_hub/generated/assets.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(body: const PageViewExample());
  }

  static const routeName = 'onBoarding';
}

class PageViewExample extends StatefulWidget {
  const PageViewExample({super.key});

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final TextTheme textTheme = Theme.of(context).textTheme;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        PageView(
          controller: _pageViewController,
          onPageChanged: _handlePageViewChanged,
          children: <Widget>[
            //* first splash page
            OnBoardingWidget(
              logoImagePath: Assets.pngFruitBasketAmico1Splash1,
              isOnBoarding1: true,
              backgroundImagePath: Assets.pngSplash1Orange,
            ),

            //* seconde splash page
            OnBoardingWidget(
              logoImagePath: Assets.pngPineappleCuate1Png,
              isOnBoarding1: false,
              backgroundImagePath: Assets.pngSplash2Green,
            ),
          ],
        ),
        //* animated Indicator
        Positioned(
          bottom: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(2, (index) {
              return FadeIn(
                duration: const Duration(seconds: 2),
                delay: const Duration(milliseconds: 3500),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: _currentPageIndex == index ? 16 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color:
                        _currentPageIndex == index
                            ? AppColors.green1_500
                            : AppColors.green500,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  void _handlePageViewChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });

    if (_isOnDesktopAndWeb) {
      _tabController.index = index;
    }
  }

  bool get _isOnDesktopAndWeb =>
      kIsWeb ||
      switch (defaultTargetPlatform) {
        TargetPlatform.macOS ||
        TargetPlatform.linux ||
        TargetPlatform.windows => true,
        TargetPlatform.android ||
        TargetPlatform.iOS ||
        TargetPlatform.fuchsia => false,
      };
}
