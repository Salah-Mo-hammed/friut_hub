import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';

class PriceRangeSlider extends StatefulWidget {
  TextEditingController minPriceController;
  TextEditingController maxPriceController;

  PriceRangeSlider({
    super.key,
    required this.minPriceController,
    required this.maxPriceController,
  });

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues _priceRange = const RangeValues(50, 300);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        valueIndicatorColor: Colors.transparent,
        valueIndicatorTextStyle: const TextStyle(
          color: Colors.transparent,
        ),
      ),
      child: RangeSlider(
        activeColor: AppColors.green1_500,
        values: _priceRange,
        min: 0,
        max: 500,
        divisions: 100,
        labels: RangeLabels(
          '\$${_priceRange.start.toInt()}',
          '\$${_priceRange.end.toInt()}',
        ),
        onChanged: (values) {
          setState(() {
            _priceRange = values;
          });
        },
      ),
    );
  }
}
