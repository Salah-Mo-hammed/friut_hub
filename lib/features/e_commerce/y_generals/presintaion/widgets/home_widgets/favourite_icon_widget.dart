import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/features/e_commerce/favorites/presintation/bloc/favorites_bloc.dart';
import 'package:friut_hub/features/e_commerce/products/domain/entities/product_entity.dart';
import 'package:friut_hub/generated/assets.dart';

class FavouriteIconWidget extends StatefulWidget {
  final ProductEntity product;
  const FavouriteIconWidget({
    super.key,
    required this.product,
  });

  @override
  State<FavouriteIconWidget> createState() => _FavouriteIconWidgetState();
}

class _FavouriteIconWidgetState extends State<FavouriteIconWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesBloc, FavoritesState>(
      listener: (context, state) {
        if (state is FavoritesError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        // check if this product is in favorites
        final isFav = state is GotAllFavorites &&
            state.products.any((p) => p.id == widget.product.id);

        return GestureDetector(
          onTap: () {
            if (isFav) {
              context.read<FavoritesBloc>().add(
                RemoveFromFavoritesEvent(productId: widget.product.id),
              );
            } else {
              context.read<FavoritesBloc>().add(
                AddToFavoritesEvent(productId: widget.product.id),
              );
            }
          },
          child: SvgPicture.asset(
            isFav ? Assets.svgHeartFilled : Assets.svgHeart,
          ),
        );
      },
    );
  }
}