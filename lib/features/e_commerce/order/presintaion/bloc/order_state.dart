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

 class DoneCreateingOrder extends OrderState {}
