import 'package:ecommerce_app/core/configs/themes/app_colors.dart';
import 'package:ecommerce_app/presentation/products_details/bloc/product_quantity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            'Quantity',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  context.read<ProductQuantityCubit>().decrement();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: AppColors.primary, shape: BoxShape.circle),
                  child: const Center(
                    child: Icon(
                      Icons.remove,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const Gap(20),
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) {
                  return Text(
                    state.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  );
                },
              ),
            const Gap(20),
             InkWell(
                onTap: () {
                  context.read<ProductQuantityCubit>().increment();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: AppColors.primary, shape: BoxShape.circle),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
