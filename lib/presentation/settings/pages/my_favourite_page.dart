import 'package:ecommerce_app/common/bloc/product/product_display_cubit.dart';
import 'package:ecommerce_app/common/bloc/product/product_display_state.dart';
import 'package:ecommerce_app/common/widgets/appbar/basic_appbar.dart';
import 'package:ecommerce_app/common/widgets/list_of_products/list_of_products.dart';
import 'package:ecommerce_app/domain/product/usecases/get_favourite_products.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavouritePage extends StatelessWidget {
  const MyFavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text("My Favourites"),
      ),
      body: BlocProvider(
        create: (context) =>
            ProductsDisplayCubit(useCase: sl<GetFavouriteProductsUseCase>())
              ..displayProducts(),
        child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
            builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductsLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListOfProducts(products: state.products),
            );
          }
          if (state is LoadProductsFailure) {
            return const Center(
              child: Text('Please try again'),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
