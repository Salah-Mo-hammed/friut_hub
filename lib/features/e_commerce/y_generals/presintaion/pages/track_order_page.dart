import 'package:flutter/material.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/checkout_widgets/track_order_container.dart';
import 'package:friut_hub/generated/assets.dart';

class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({super.key});
  static const routeName = 'TrackOrder';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "تتبع الطلب"),
      body: Column(
        children: [
          Container(
            width: 342,
            height: 107,
            decoration: BoxDecoration(
              color: Color(0xFFF2F3F3),
            ), //Color(0x7FF2F3F3)
            child: TrackOrderContainer(
              isSecondContainer: false,
              h1: "طلب رقم: 1234567#",
              subH1: "تم الطلب :22 مارس ,2024",
              assetIcon: Assets.svgTrackOrder1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(),
          ),

          Expanded(
            child: Container(
              width: 342,
              decoration: BoxDecoration(color: Color(0xFFF2F3F3)), //
              child: Column(
                children: [
                  //! 2
                  TrackOrderContainer(
                    isSecondContainer: true,
                    h1: "تتبع الطلب",
                    subH1: "22 مارس , 2024",
                    assetIcon: Assets.svgTrackOrder2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Divider(),
                  ),
                  // !  3
                  TrackOrderContainer(
                    isSecondContainer: true,
                    h1: "قبول الطلب",
                    subH1: "22 مارس , 2024",
                    assetIcon: Assets.svgTrackOrder3,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Divider(),
                  ),

                  //! 4
                  TrackOrderContainer(
                    isSecondContainer: true,
                    h1: "تم شحن الطلب",
                    subH1: "22 مارس , 2024",
                    assetIcon: Assets.svgTrackOrder4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    child: Divider(),
                  ),

                  // ! 5
                  TrackOrderContainer(
                    isSecondContainer: true,
                    h1: "خرج للتوصيل",
                    subH1: "22 مارس , 2024",
                    assetIcon: Assets.svgTrackOrder5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Divider(),
                  ),

                  // ! 6
                  TrackOrderContainer(
                    isSecondContainer: true,
                    h1: "تم تسليم",
                    subH1: "",
                    assetIcon: Assets.svgTrackOrder6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Divider(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
