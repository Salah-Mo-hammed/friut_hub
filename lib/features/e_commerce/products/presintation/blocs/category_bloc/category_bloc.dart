import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friut_hub/features/e_commerce/products/domain/entities/category_entity.dart';
import 'package:friut_hub/features/e_commerce/products/domain/entities/product_entity.dart';
import 'package:friut_hub/features/e_commerce/products/domain/usecases/get_all_categories_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  GetAllCategoriesUsecase getAllCategoriesUsecase;
  CategoryBloc({
    required this.getAllCategoriesUsecase,
  }) : super(CategoryInitial()) {
    on<GetAllCategoriesEvent>(_onGetAllCategories);
  }

  FutureOr<void> _onGetAllCategories(
    GetAllCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    final result = await getAllCategoriesUsecase.call();
    result.fold(
      (failure) {
        emit(CategoryError(failure.message));
      },
      (categories) {
        emit(CategoriesLoaded(categories: categories));
      },
    );
  }

 
}
