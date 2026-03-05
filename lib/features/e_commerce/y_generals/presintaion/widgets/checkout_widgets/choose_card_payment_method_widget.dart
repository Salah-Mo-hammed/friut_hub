import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChooseCardPaymentMethod extends StatelessWidget {
  final String selectedCard;
  final String unSelectedCard;
  final bool isSelected;
  final VoidCallback onTap;

  const ChooseCardPaymentMethod({
    super.key,
    required this.isSelected,
    required this.selectedCard,
    required this.unSelectedCard,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 43,
        width: 67,
        decoration: ShapeDecoration(
          color: !isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: const Color(0xFFD6DCE5),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            isSelected ? selectedCard : unSelectedCard,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
