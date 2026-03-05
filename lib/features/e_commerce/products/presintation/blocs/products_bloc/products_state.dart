part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final bool didSearch;
  final List<ProductEntity> products;
  const ProductsLoaded({required this.products, required this.didSearch});
}

class ProductError extends ProductsState {
  final String message;
  const ProductError(this.message);
}
