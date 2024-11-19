import 'package:ecommerce_app/common/bloc/button/button_cubit.dart';
import 'package:ecommerce_app/common/bloc/button/button_state.dart';
import 'package:ecommerce_app/common/helper/navigation/app_navigation.dart';
import 'package:ecommerce_app/common/helper/product/product_price.dart';
import 'package:ecommerce_app/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce_app/data/order/models/add_to_cart_req.dart';
import 'package:ecommerce_app/domain/order/usecases/add_to_cart.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:ecommerce_app/presentation/cart/pages/cart_page.dart';
import 'package:ecommerce_app/presentation/products_details/bloc/product_color_selection.dart';
import 'package:ecommerce_app/presentation/products_details/bloc/product_quantity.dart';
import 'package:ecommerce_app/presentation/products_details/bloc/product_size_selection.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity productEntity;
  const AddToBag({
    required this.productEntity,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonStateCubit,ButtonState>(
      listener: (context, state) {
        if (state is ButtonSuccessState) {
          AppNavigation.push(context, const CartPage());
        } 
        if (state is ButtonFailureState) {
          var snackbar = SnackBar(content: Text(state.errorMessage),behavior: SnackBarBehavior.floating,);
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
          child: BasicReactiveButton(
            onPressed: () {
              context.read<ButtonStateCubit>().execute(
                usecase: sl<AddToCartUseCase>(),
                params: AddToCartReq(
                  productId: productEntity.productId, 
                  productTitle: productEntity.title,
                  productQuantity: context.read<ProductQuantityCubit>().state,
                  productColor: productEntity.colors[context.read<ProductColorSelectionCubit>().selectedIndex].title,
                  productSize: productEntity.sizes[context.read<ProductSizeSelectionCubit>().selectedIndex],
                  productPrice: productEntity.price.toDouble(), 
                  totalPrice: ProductPriceHelper.provideCurrentPrice(productEntity) * context.read<ProductQuantityCubit>().state,
                  productImage: productEntity.images[0],
                  createdDate: DateTime.now().toString()
                )
             );
            },
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<ProductQuantityCubit,int>(
                  builder: (context, state) {
                  var price = ProductPriceHelper.provideCurrentPrice(productEntity) * state;
                  return Text(
                   "\$${price.toString()}",
                   style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14
                  ),
                 );
                }, 
              ),
              const Text(
                 'Add to Bag',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 14
                ),
              ),
            ],
          )
      ),
        ),
    );
 }
}