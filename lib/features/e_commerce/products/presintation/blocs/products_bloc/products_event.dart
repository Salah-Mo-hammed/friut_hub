part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetAllProductsEvent extends ProductsEvent {}

class GetProductsByCategoryEvent extends ProductsEvent {
  final int categoryId;
  const GetProductsByCategoryEvent(this.categoryId);
}


class SearchProductsEvent extends ProductsEvent {
  final String searchQuery;
  const SearchProductsEvent(this.searchQuery);
}
