import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friut_hub/features/e_commerce/products/domain/entities/product_entity.dart';
import 'package:friut_hub/features/e_commerce/products/domain/usecases/get_all_products_usecase.dart';
import 'package:friut_hub/features/e_commerce/category/domain/usecases/get_category_products_usecase.dart';
import 'package:friut_hub/features/e_commerce/products/domain/usecases/search_prodcuts_usecase.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  GetAllProductsUsecase getAllProductsUsecase;
  SearchProdcutsUsecase searchProdcutsUsecase;
  GetCategoryProductsUsecase getCategoryProductsUsecase;
  ProductsBloc({
    required this.getAllProductsUsecase,
    required this.searchProdcutsUsecase,
    required this.getCategoryProductsUsecase,
  }) : super(ProductInitial()) {
    on<GetAllProductsEvent>(_onGetAllProducts);
    on<SearchProductsEvent>(_onSearch);
    on<GetProductsByCategoryEvent>(_onGetProductsByCategory);
  }

  FutureOr<void> _onGetAllProducts(
    GetAllProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    final result = await getAllProductsUsecase.call();
    result.fold(
      (failure) {
        emit(ProductError(failure.message));
      },
      (products) {
        emit(ProductsLoaded(products: products, didSearch: false));
      },
    );
  }

  FutureOr<void> _onSearch(
    SearchProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    final result = await searchProdcutsUsecase.call(
      event.searchQuery,
    );
    result.fold(
      (failure) {
        emit(ProductError(failure.message));
      },
      (products) {
        emit(ProductsLoaded(products: products, didSearch: true));
      },
    );
  }

  FutureOr<void> _onGetProductsByCategory(
    GetProductsByCategoryEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    final result = await getCategoryProductsUsecase.call(event.categoryId);
    result.fold(
      (failure) {
        emit(ProductError(failure.message));
      },
      (products) {
        emit(ProductsLoaded(products: products, didSearch: false));
      },
    );
  }
}
