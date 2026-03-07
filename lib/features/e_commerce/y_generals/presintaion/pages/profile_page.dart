import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/features/auth/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:friut_hub/features/auth/presentation/pages/login_page.dart';
import 'package:friut_hub/features/e_commerce/order/presintaion/bloc/order_bloc.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/about_us_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/favoutires_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/language_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/my_requests_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/payments_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/personal_file_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/profile_widgets/profile_generals_widget.dart';
import 'package:friut_hub/generated/assets.dart';

class ProfilePage extends StatelessWidget {
  final String userFullName;
  final String userEmail;

  const ProfilePage({
    super.key,
    required this.userFullName,
    required this.userEmail,
  });

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

                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userFullName,
                          style: AppTextStyles.bodyBaseBold.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          userEmail,
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
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      PersonalProfilePage.routeName,
                      arguments: {
                        'email': userEmail,
                        'name': userFullName,
                      },
                    );
                  },
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
                  onPressed: () {
                    //! get all orders
                    context.read<OrderBloc>().add(
                      GetUserOrdersEvent(),
                    );
                    Navigator.pushNamed(
                      context,
                      MyRequestsPage.routeName,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileGenerals(
                  imageAsset: Assets.svgEmptyWallet,
                  title: 'المدفوعات',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      PaymentsPage.routeName,
                    );
                  },
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
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      FavoutiresPage.routeName,
                    );
                  },
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileGenerals(
                  imageAsset: Assets.svgGlobal,
                  title: 'اللغة',
                  isNotification: false,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      LanguagePage.routeName,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileGenerals(
                  imageAsset: Assets.svgMagicpen,
                  title: 'الوضع',
                  isNotification: true,
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  "المساعدة",
                  style: AppTextStyles.bodyBaseBold.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileGenerals(
                  imageAsset: Assets.svgInfoCircle,
                  title: 'من نحن',
                  isNotification: false,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AboutUsPage.routeName,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(),
              ),
            ],
          ),

          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: true, // لو عايز يقفل لما يضغط بره
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "هل ترغب في تسجيل الخروج ؟",
                            style: AppTextStyles.bodyBaseBold
                                .copyWith(color: Colors.black),
                          ),
                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 140,
                                height: 70,
                                child: MyButton(
                                  doLogOut: true,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  content: Text(
                                    "لا ارغب",
                                    style: AppTextStyles.bodyBaseBold
                                        .copyWith(
                                          color: AppColors.green1_500,
                                        ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: 150,
                                height: 70,
                                child: MyButton(
                                  onTap: () {
                                    context.read<LoginBloc>().add(
                                      LogoutEvent(),
                                    );
                                    Navigator.pushReplacementNamed(
                                      context,
                                      LoginPage.routeName,
                                    );
                                  },
                                  content: Text(
                                    "تأكيد",
                                    style: AppTextStyles.bodyBaseBold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
