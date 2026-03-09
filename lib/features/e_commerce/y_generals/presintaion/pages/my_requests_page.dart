import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/order/presintaion/bloc/order_bloc.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/profile_widgets/expandable_order_item.dart';

class MyRequestsPage extends StatelessWidget {
  static const routeName = "MyRequestsPage";
  const MyRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "طلباتي"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<OrderBloc, OrderState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is OrderLoading) {
              return CircularProgressIndicator();
            } else if (state is GotUserOrders) {
              return ListView.builder(
                itemCount: state.orders.length,
                itemBuilder:
                    (context, index) => ExpandableOrderItem(
                      orderEntity: state.orders[index],
                    ),
              );
            }
            if (state is OrderInitial) {
              context.read<OrderBloc>().add(GetUserOrdersEvent());
            }
            return Text("$state");
          },
        ),
      ),
    );
  }
}
