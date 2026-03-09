// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class GetAllFavoritesEvent extends FavoritesEvent {}

class AddToFavoritesEvent extends FavoritesEvent {
  int productId;
  AddToFavoritesEvent({required this.productId});
}

class RemoveFromFavoritesEvent extends FavoritesEvent {
  int productId;
  RemoveFromFavoritesEvent({
    required this.productId,
  });
}
