import 'package:flutter/material.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/home_widgets/add_icon.dart';

class ItemQuantityWidget extends StatefulWidget {
  final ValueChanged<int> onQuantityChanged;

  const ItemQuantityWidget({
    super.key,
    required this.onQuantityChanged,
  });

  @override
  State<ItemQuantityWidget> createState() =>
      _ItemQuantityWidgetState();
}

class _ItemQuantityWidgetState extends State<ItemQuantityWidget> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ItemAddIcon(
          onTap: () {
            setState(() {
              quantity++;
            });
            widget.onQuantityChanged(quantity);
          },
        ),
        SizedBox(width: 20),
        Text(
          quantity.toString(),
          style: AppTextStyles.bodyBaseBold.copyWith(
            fontSize: 21,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 20),
        ItemAddIcon(
          icon: Icons.remove,
          onTap: () {
            setState(() {
              if (quantity != 1) quantity--;
            });
            widget.onQuantityChanged(quantity);
          },
        ),
      ],
    );
  }
}
