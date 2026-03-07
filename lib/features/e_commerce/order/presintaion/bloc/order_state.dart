// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderError extends OrderState {
  final String message;

  const OrderError({required this.message});
}

class GotUserOrders extends OrderState {
  List<OrderEntity> orders;
  GotUserOrders({
    required this.orders,
  });
}
