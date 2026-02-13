
import 'package:flutter/material.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/domain/entites/trackong_step_entity.dart';

class OrderTrackingTimeline extends StatelessWidget {
  final List<TrackingStep> steps;

  const OrderTrackingTimeline({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        final step = steps[index];
        final isLast = index == steps.length - 1;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  ! track date
              Text(step.date, style: AppTextStyles.bodySmallMedium),

              // ! track line
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        step.title,
                        style: AppTextStyles.bodySmallBold,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // ! track circle and line
              Column(
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color:
                          step.isCompleted
                              ? Colors.green
                              : Colors.grey.shade400,
                      shape: BoxShape.circle,
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        color:
                            step.isCompleted
                                ? Colors.green
                                : Colors.grey.shade300,
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
