import 'package:ecommerce_app/common/helper/bottom_sheet/app_bottom_sheet.dart';
import 'package:ecommerce_app/core/configs/themes/app_colors.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:ecommerce_app/presentation/products_details/bloc/product_color_selection.dart';
import 'package:ecommerce_app/presentation/products_details/widgets/product_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SelectedColor extends StatelessWidget {
  final ProductEntity productEntity;
  const SelectedColor({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(
            context,
            BlocProvider.value(
                value: BlocProvider.of<ProductColorSelectionCubit>(context),
                child: ProductColors(
                  productEntity: productEntity,
                )));
      },
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.circular(100)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Color',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            Row(
              children: [
                BlocBuilder<ProductColorSelectionCubit, int>(
                  builder: (context, state) {
                    return Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(
                              productEntity.colors[state].rgb[0],
                              productEntity.colors[state].rgb[1],
                              productEntity.colors[state].rgb[2],
                              1),
                          shape: BoxShape.circle),
                    );
                  },
                ),
                const Gap(10),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
