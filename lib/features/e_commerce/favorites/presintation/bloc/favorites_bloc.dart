import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friut_hub/features/e_commerce/cart/domain/usecases/remove_frpm_cart_usecase.dart';
import 'package:friut_hub/features/e_commerce/favorites/domain/usecases/add_to_favorites_usecase.dart';
import 'package:friut_hub/features/e_commerce/favorites/domain/usecases/get_all_favorites_usecase.dart';
import 'package:friut_hub/features/e_commerce/favorites/domain/usecases/remove_from_favorites_usecase.dart';
import 'package:friut_hub/features/e_commerce/products/domain/entities/product_entity.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  GetAllFavoritesUsecase getAllFavoritesUsecase;
  AddToFavoritesUsecase addToFavoritesUsecase;
  RemoveFromFavoritesUsecase removeFromFavoritesUsecase;
  FavoritesBloc({
    required this.getAllFavoritesUsecase,
    required this.addToFavoritesUsecase,
    required this.removeFromFavoritesUsecase,
  }) : super(FavoritesInitial()) {
    on<GetAllFavoritesEvent>(_onGetAllFavorites);
    on<AddToFavoritesEvent>(_onAddToFavorites);
    on<RemoveFromFavoritesEvent>(_onRemoveFromFavorites);
  }

  FutureOr<void> _onGetAllFavorites(
    GetAllFavoritesEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());

    final result = await getAllFavoritesUsecase.call();
    result.fold(
      (faliure) {
        emit(FavoritesError(message: faliure.message));
      },
      (favoriteProducts) {
        emit(GotAllFavorites(products: favoriteProducts));
      },
    );
  }

  FutureOr<void> _onAddToFavorites(
    AddToFavoritesEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());

    final result = await addToFavoritesUsecase.call(event.productId);
    await result.fold(
      (failure) async => emit(
        FavoritesError(
          message: "error in addin to favorite ${failure.message}",
        ),
      ),
      (unit) async {
        final updated = await getAllFavoritesUsecase.call();
        updated.fold(
          (failure) => emit(
            FavoritesError(
              message:
                  "error in getting  favorites ${failure.message}",
            ),
          ),
          (products) => emit(GotAllFavorites(products: products)),
        );
      },
    );
  }

  FutureOr<void> _onRemoveFromFavorites(
    RemoveFromFavoritesEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());

    final result = await removeFromFavoritesUsecase.call(
      event.productId,
    );
    await result.fold(
      (failure) async => emit(
        FavoritesError(
          message:
              "error in removing from favorite ${failure.message}",
        ),
      ),
      (unit) async {
        final updated = await getAllFavoritesUsecase.call();
        updated.fold(
          (failure) => emit(
            FavoritesError(
              message:
                  "error in getting  favorites ${failure.message}",
            ),
          ),
          (products) => emit(GotAllFavorites(products: products)),
        );
      },
    );
  }
}
