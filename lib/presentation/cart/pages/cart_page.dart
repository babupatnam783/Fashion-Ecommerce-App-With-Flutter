import 'package:ecommerce_app/common/widgets/appbar/basic_appbar.dart';
import 'package:ecommerce_app/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_app/domain/order/entities/product_ordered.dart';
import 'package:ecommerce_app/presentation/cart/bloc/cart_product_display_state.dart';
import 'package:ecommerce_app/presentation/cart/bloc/cart_products_display_cubit.dart';
import 'package:ecommerce_app/presentation/cart/widgets/total_bill_card_check_out.dart';
import 'package:ecommerce_app/presentation/cart/widgets/product_ordered_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text("Cart"),
      ),
      body: BlocProvider(
        create: (context) => CartProductsDisplayCubit()..displayCartProducts(),
        child: BlocBuilder<CartProductsDisplayCubit, CartProductDisplayState>(
            builder: (context, state) {
          if (state is CartProductDisplayLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartProductDisplayLoaded) {
            return Stack(
              children: [
                _products(state.products),
                state.products.isNotEmpty
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: CheckOut(
                          products: state.products,
                        ),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppVectors.cartBag),
                            const Gap(10),
                            const Text(
                              "Cart is empty",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
              ],
            );
          }
          if (state is FailureCartProductDisplay) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return Container();
        }),
      ),
    );
  }

  Widget _products(List<ProductOrderedEntity> products) {
    return ListView.separated(
      itemCount: products.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      separatorBuilder: (context, index) => const Gap(10),
      itemBuilder: (context, index) {
        return ProductOrderedCard(productOrderedEntity: products[index]);
      },
    );
  }
}
