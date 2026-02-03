import 'package:flutter/material.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/best_sellings_page.dart';

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
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                BestSellingsPage.routeName,
              );
            },
            child: Text("المزيد", style: AppTextStyles.bodySmall),
          ),
        ],
      ),
    );
  }
}
