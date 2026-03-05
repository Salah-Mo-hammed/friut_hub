import 'package:flutter/material.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/checkout_widgets/choose_payment_on_charge_page.dart';

class CheckOutChargePage extends StatefulWidget {
  const CheckOutChargePage({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  State<CheckOutChargePage> createState() =>
      _CheckOutChargePageState();
}

class _CheckOutChargePageState extends State<CheckOutChargePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          child: choosePaymentOnCharge(
            paymentMethod: "الدفع عند الاستلام",
            price: "40 جنيه",
            choosen: selectedIndex == 0,
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          child: choosePaymentOnCharge(
            paymentMethod: "الدفع بPayPal",
            price: "10 جنيه",
            choosen: selectedIndex == 1,
          ),
        ),
        SizedBox(height: 150),
        MyButton(onTap: widget.onNext, content: 
                          Text( "التالي", style: AppTextStyles.bodyBaseBold),
        
        
        
        ),
      ],
    );
  }
}
