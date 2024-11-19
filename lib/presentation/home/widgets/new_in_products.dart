import 'package:ecommerce_app/common/bloc/product/product_display_cubit.dart';
import 'package:ecommerce_app/common/bloc/product/product_display_state.dart';
import 'package:ecommerce_app/common/widgets/productcard/product_card.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:ecommerce_app/domain/product/usecases/get_new_in.dart';
import 'package:ecommerce_app/presentation/home/widgets/title_and_see_all.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class NewInProducts extends StatelessWidget {
  const NewInProducts ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsDisplayCubit(useCase: sl<GetNewInUseCase>())..displayProducts(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const CircularProgressIndicator();
            }
            if (state is ProductsLoaded) {
              return Column(
                children: [
                  const TitleAndSeeAll(title: "New In"),
                  const Gap(20),
                  _products(state.products)
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const Gap(10),
        itemBuilder: (context, index) {
          return ProductCard(productEntity: products[index],);
        },
      ),
    );
  }
}
