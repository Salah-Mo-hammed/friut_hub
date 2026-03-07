import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friut_hub/features/e_commerce/order/domain/entities/create_order_param.dart';
import 'package:friut_hub/features/e_commerce/order/domain/usecase/create_order_usecase.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  CreateOrderUsecase createOrderUsecase;
  OrderBloc({required this.createOrderUsecase})
    : super(OrderInitial()) {
    on<CreateOrderEvent>(_OnCreateOrder);
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
        emit(DoneCreateingOrder());
      },
    );
  }
}
