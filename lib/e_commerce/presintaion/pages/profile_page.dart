import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/generated/assets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 70.h(context)),
              Center(
                child: Text(
                  "حسابي",
                  style: AppTextStyles.bodyBaseBold.copyWith(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 20.h(context)),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      Assets.pngPersonIcon,
                      fit: BoxFit.fill,
                    ),
                    // SvgPicture.asset(
                    //   Assets.svgPersonIcon,
                    //   fit: BoxFit.fill,
                    // ),
                    SizedBox(width: 5),
                    Column(
                      children: [
                        Text(
                          "أحمد مصطفي",
                          style: AppTextStyles.bodyBaseBold.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "mail@mail.com",
                          style: AppTextStyles.bodyBase.copyWith(
                            color: AppColors.grayscale400,
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  "عام",
                  style: AppTextStyles.bodyBaseBold.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileGenerals(
                  imageAsset: Assets.svgUser,
                  title: 'الملف الشخصي',
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileGenerals(
                  imageAsset: Assets.svgBox,
                  title: 'طلباتي',
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileGenerals(
                  imageAsset: Assets.svgHeart,
                  title: 'المفضلة',
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileGenerals(
                  imageAsset: Assets.svgNotification,
                  title: 'الاشعارات',
                  isNotification: true,
                  onPressed: () {},
                ),
              ),
            ],
          ),

          Container(
            height: 41.h(context),
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.green1_50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                Text(
                  "تسجيل الخروج",
                  style: AppTextStyles.bodySmallBold.copyWith(
                    color: AppColors.green1_500,
                    fontSize: 15,
                  ),
                ),
                SvgPicture.asset(Assets.svgExitIcon),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileGenerals extends StatelessWidget {
  final String imageAsset;
  final String title;
  final void Function()? onPressed;
  bool isNotification;

  ProfileGenerals({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.onPressed,
    this.isNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              imageAsset,
              height: 20.h(context),
              width: 20.w(context),
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: AppTextStyles.bodyBase.copyWith(
                color: AppColors.grayscale400,
                fontSize: 18,
              ),
            ),
          ],
        ),
        if (!isNotification) ...[
          IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ] else ...[
          SwitchButtonWidget(),
        ],
      ],
    );
  }
}

class SwitchButtonWidget extends StatefulWidget {
  const SwitchButtonWidget({super.key});

  @override
  State<SwitchButtonWidget> createState() =>
      _SwitchButtonWidgetState();
}

class _SwitchButtonWidgetState extends State<SwitchButtonWidget> {
  late bool _value;
  @override
  void initState() {
    // TODO: to call the real value from backend (later)
    // ! for now we will make it false
    _value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _value,
      onChanged: (newValue) {
        // ! here is also some work when the backend be ready
        setState(() {
          _value = newValue;
        });
      },
    );
  }
}
