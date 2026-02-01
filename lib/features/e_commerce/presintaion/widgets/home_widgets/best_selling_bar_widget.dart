
import 'package:flutter/material.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class MainBestSellingWIdget extends StatelessWidget {
  const MainBestSellingWIdget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "الأكثر مبيعًا",
            style: AppTextStyles.bodyBaseBold.copyWith(
              color: Colors.black,
            ),
          ),
          Text("المزيد", style: AppTextStyles.bodySmall),
        ],
      ),
    );
  }
}
