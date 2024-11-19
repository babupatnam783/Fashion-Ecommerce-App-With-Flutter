import 'package:ecommerce_app/core/configs/themes/app_colors.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:ecommerce_app/presentation/products_details/bloc/favourite_icon_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteButton extends StatelessWidget {
  final ProductEntity productEntity;
  const FavouriteButton({super.key,required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<FavouriteIconCubit>().onTap(productEntity);
      },
      icon: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
            color: AppColors.secondBackground, shape: BoxShape.circle),
        child: BlocBuilder<FavouriteIconCubit, bool>(
          builder: (context, state) {
            return Icon(
              state ? Icons.favorite :Icons.favorite_outline,
              size: 15,
              color: Colors.white,
            );
          },
        ),
      ),
    );
  }
}
