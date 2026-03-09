import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/generated/assets.dart';

class DiscountsContainerWidget extends StatelessWidget {
  final String image;
  final String circleImage;
  const DiscountsContainerWidget({
    super.key,
    required this.image,
    required this.circleImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 158,
        width: 342,

        child: Stack(
          children: [
            Image.asset(image),
            Positioned(
              right: 0,
              child: SvgPicture.asset(circleImage),
            ),
            Positioned(
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 30.0,
                ),
                child: SizedBox(
                  height: 110,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "عروض العيد",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            "خصم %25",
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: 116,
                            height: 32,
                            padding: const EdgeInsets.all(3),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF3F5F7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  4,
                                ),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => TestWidget(),
                                  ),
                                );
                              },
                              child: Center(
                                child: Text(
                                  "تسوق الان",
                                  style: AppTextStyles.bodySmall
                                      .copyWith(
                                        color: AppColors.green1_500,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
