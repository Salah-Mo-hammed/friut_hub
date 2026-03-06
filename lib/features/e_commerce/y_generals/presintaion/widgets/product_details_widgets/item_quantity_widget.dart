import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/cart/presintation/bloc/cart_bloc.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/home_widgets/add_icon.dart';

class ItemQuantityWidget extends StatefulWidget {
  final int itemId;
  bool isIndetaildPRoduct;
  final ValueChanged<int> onQuantityChanged;
  final int maxQuantity;
  int initialQuantity;
  ItemQuantityWidget({
    super.key,
    required this.itemId,
    required this.onQuantityChanged,
    required this.maxQuantity,
    this.isIndetaildPRoduct = false,
    this.initialQuantity = 1,
  });

  @override
  State<ItemQuantityWidget> createState() =>
      _ItemQuantityWidgetState();
}

class _ItemQuantityWidgetState extends State<ItemQuantityWidget> {
  late int quantity = widget.initialQuantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ItemAddIcon(
          onTap: () {
            setState(() {
              if (quantity != widget.maxQuantity) quantity++;
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
              if (widget.isIndetaildPRoduct) {
                if (quantity != 1) quantity--;
              }
              if (quantity == 1) {
                context.read<CartBloc>().add(
                  RemoveFromCartEvent(productId: widget.itemId),
                );
              }
              if (!widget.isIndetaildPRoduct) {
                quantity--;
              }
            });
            widget.onQuantityChanged(quantity);
          },
        ),
      ],
    );
  }
}
