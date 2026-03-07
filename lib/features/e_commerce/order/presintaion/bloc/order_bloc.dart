import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friut_hub/features/e_commerce/order/domain/entities/create_order_param.dart';
import 'package:friut_hub/features/e_commerce/order/domain/entities/order_entity.dart';
import 'package:friut_hub/features/e_commerce/order/domain/usecase/create_order_usecase.dart';
import 'package:friut_hub/features/e_commerce/order/domain/usecase/get_users_order_usecase.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  CreateOrderUsecase createOrderUsecase;
  GetUserOrdersUsecase getUserOrdersUsecase;
  OrderBloc({
    required this.createOrderUsecase,
    required this.getUserOrdersUsecase,
  }) : super(OrderInitial()) {
    on<CreateOrderEvent>(_OnCreateOrder);
    on<GetUserOrdersEvent>(_onGetUserOrders);
  }

  FutureOr<void> _OnCreateOrder(
    CreateOrderEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoading());
    final result = await createOrderUsecase.call(event.orderParams);
    result.fold(
      (failure) {
        emit(OrderError(message: failure.message));
      },
      (unit) {
        emit(OrderInitial());
      },
    );
  }

  FutureOr<void> _onGetUserOrders(GetUserOrdersEvent event, Emitter<OrderState> emit) async{
        emit(OrderLoading());
    final result = await getUserOrdersUsecase.call();
    result.fold(
      (failure) {
        emit(OrderError(message: failure.message));
      },
      (orders) {
        emit(GotUserOrders(orders:orders ));
      },
    );
  }
}
