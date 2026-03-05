part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();
  
  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState {}

class CategoriesLoaded extends CategoryState {
  final List<CategoryEntity> categories;
  const CategoriesLoaded({required this.categories,});
}
class CategoryProductsLoaded extends CategoryState {
  final List<ProductEntity> products;
  const CategoryProductsLoaded({required this.products,});
}

class CategoryError extends CategoryState {
  final String message;
  const CategoryError(this.message);
}
