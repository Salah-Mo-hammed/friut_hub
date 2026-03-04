import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friut_hub/features/e_commerce/products/domain/entities/product_entity.dart';
import 'package:friut_hub/features/e_commerce/products/domain/usecases/get_detaild_product_usecase.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  GetDetaildProductUsecase getDetaildProductUsecase;

  ProductDetailsBloc({
        required this.getDetaildProductUsecase,

  }) : super(ProductDetailsInitial()) {
    on<GetProductByIdEvent>(_onGetDetaildProduct);

  }

  FutureOr<void> _onGetDetaildProduct(
    GetProductByIdEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(ProductDetailsLoading());
    final result = await getDetaildProductUsecase.call(
      event.productId.toString(),
    );
    result.fold((failure) {        emit(ProductDetailsError(failure.message));
}, (detaildProduct) {
        emit(ProductByIdLoaded(product: detaildProduct));


});
  }

}
