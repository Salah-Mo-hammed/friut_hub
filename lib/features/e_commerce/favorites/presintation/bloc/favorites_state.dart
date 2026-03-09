part of 'favorites_bloc.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class GotAllFavorites extends FavoritesState {
  List<ProductEntity> products;
  GotAllFavorites({required this.products});
}

final class FavoritesActionSuccess extends FavoritesState {}

final class FavoritesError extends FavoritesState {
 final String message;

  const FavoritesError({required this.message});

}
