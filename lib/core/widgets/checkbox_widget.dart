// //! still need improvments , how to check that its true , this is a seperated widget
import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class PoliciesCheckBox extends FormField<bool> {
  PoliciesCheckBox({
    super.key,
    bool super.initialValue = false,
    required String title,
    super.validator,
    ValueChanged<bool>? onChanged,
  }) : super(
         builder: (FormFieldState<bool> state) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 children: [
                   Checkbox(
                     value: state.value,
                     activeColor: AppColors.green1_500,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(5),
                     ),
                     onChanged: (value) {
                       state.didChange(value);
                       if (onChanged != null && value != null) {
                         onChanged(value);
                       }
                     },
                   ),
                   Expanded(
                     child: Text(
                       title,
                       style: AppTextStyles.bodySmall.copyWith(
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                 ],
               ),
               if (state.hasError)
                 Padding(
                   padding: const EdgeInsets.only(left: 12),
                   child: Text(
                     state.errorText!,
                     style: const TextStyle(
                       color: Colors.red,
                       fontSize: 12,
                     ),
                   ),
                 ),
             ],
           );
         },
       );
}

// class PoliciesCheckBox extends StatefulWidget {
//   bool checkboxValeu = false;
//   PoliciesCheckBox({super.key});

//   @override
//   State<PoliciesCheckBox> createState() => _PoliciesCheckBoxState();
// }

// class _PoliciesCheckBoxState extends State<PoliciesCheckBox> {
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadiusGeometry.circular(5),
//       ),
//       activeColor: AppColors.green1_500,
//       value: widget.checkboxValeu,
//       onChanged: (value) {
//         setState(() {
//           widget.checkboxValeu = !widget.checkboxValeu;
//           //* or
//           // widget.checkboxValeu = value!;
//         });
//       },
//     );
//   }
// }
