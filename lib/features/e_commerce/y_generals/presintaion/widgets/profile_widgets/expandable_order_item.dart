import 'package:flutter/material.dart';
import 'package:friut_hub/features/e_commerce/y_generals/entites/trackong_step_entity.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/checkout_widgets/track_order_container.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/profile_widgets/order_tracking_timeline.dart';
import 'package:friut_hub/generated/assets.dart';

class ExpandableOrderItem extends StatefulWidget {
  const ExpandableOrderItem({super.key});

  @override
  State<ExpandableOrderItem> createState() =>
      _ExpandableOrderItemState();
}

class _ExpandableOrderItemState extends State<ExpandableOrderItem>
    with TickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFFF2F3F3)),
      child: Column(
        children: [
          Stack(
            children: [
              TrackOrderContainer(
                isSecondContainer: false,
                h1: "طلب رقم: 1234567#",
                subH1: "تم الطلب :22 مارس ,2024",
                assetIcon: Assets.svgTrackOrder2,
              ),
              Positioned(
                right: 10,
                top: 20,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// التفاصيل
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child:
                isExpanded
                    ? OrderTrackingTimeline(
                      steps: [
                        TrackingStep(
                          title: "تتبع الطلب",
                          date: "22 مارس ,2024",
                          isCompleted: true,
                        ),
                        TrackingStep(
                          title: "قبول الطلب",
                          date: "22 مارس ,2024",
                          isCompleted: true,
                        ),
                        TrackingStep(
                          title: "تم شحن الطلب",
                          date: "22 مارس ,2024",
                          isCompleted: true,
                        ),
                        TrackingStep(
                          title: "خرج للتوصيل",
                          date: "قيد الانتظار",
                          isCompleted: false,
                        ),
                        TrackingStep(
                          title: "تم التسليم",
                          date: "",
                          isCompleted: false,
                        ),
                      ],
                    )
                    : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
