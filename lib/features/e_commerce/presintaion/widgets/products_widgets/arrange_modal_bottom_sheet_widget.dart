import 'package:flutter/material.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';

class ArrangeModalBottomSheet extends StatefulWidget {
  const ArrangeModalBottomSheet({super.key});

  @override
  State<ArrangeModalBottomSheet> createState() =>
      _ArrangeModalBottomSheetState();
}

class _ArrangeModalBottomSheetState
    extends State<ArrangeModalBottomSheet> {
  int _selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32.h(context)),
        Text(
          " : ترتيب حسب",
          style: AppTextStyles.bodyLarge.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        SizedBox(height: 10),
        RadioListTile<int>(
          // controlAffinity:ListTileControlAffinity.trailing ,
          title: Text(
            'السعر: من الأقل للأعلى',
            style: AppTextStyles.bodyBaseBold.copyWith(
              color: Colors.black,
            ),
          ),
          value: 0,
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() => _selectedOption = value!);
          },
        ),

        RadioListTile<int>(
          title: Text(
            'السعر: من الأعلى للأقل',
            style: AppTextStyles.bodyBaseBold.copyWith(
              color: Colors.black,
            ),
          ),
          value: 1,
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() => _selectedOption = value!);
          },
        ),
        RadioListTile<int>(
          title: Text(
            'الأبجديه',
            style: AppTextStyles.bodyBaseBold.copyWith(
              color: Colors.black,
            ),
          ),
          value: 2,
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() => _selectedOption = value!);
          },
        ),
        MyButton(
          onTap: () {
            // TODO:  SHOW THE FILTERED PRODUCTS
            // ! FOR NOW WE WILL POP
            Navigator.pop(context);
            Navigator.pop(context);
          },
          buttonTitle: "تصفيه",
        ),
      ],
    );
  }
}
