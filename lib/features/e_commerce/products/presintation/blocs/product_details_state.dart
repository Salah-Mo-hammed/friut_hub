part of 'product_details_bloc.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();
  
  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {}
final class ProductDetailsLoading extends ProductDetailsState {}

class ProductByIdLoaded extends ProductDetailsState {
  final ProductEntity product;
  const ProductByIdLoaded({required this.product});
}
class ProductDetailsError extends ProductDetailsState {
  final String message;
  const ProductDetailsError(this.message);
}
