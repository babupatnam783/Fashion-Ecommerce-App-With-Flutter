import 'package:ecommerce_app/common/helper/cart/cart.dart';
import 'package:ecommerce_app/common/helper/navigation/app_navigation.dart';
import 'package:ecommerce_app/common/widgets/button/basic_button.dart';
import 'package:ecommerce_app/core/configs/themes/app_colors.dart';
import 'package:ecommerce_app/domain/order/entities/product_ordered.dart';
import 'package:ecommerce_app/presentation/cart/pages/check_out_page.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  const CheckOut({super.key,required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: const BoxDecoration(color: AppColors.secondBackground),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Subtotal",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                "\$${CartHelper.calculateCartSubtotal(products).toString()}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping Cost",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                "\$9",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tax",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                "\$0",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                "\$${CartHelper.calculateCartSubtotal(products) + 9}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
           BasicAppButton(
            onPressed: (){
              AppNavigation.push(context, CheckOutPage(products: products,));
            },
            title: 'Checkout',
          )
        ],
      ),
    );
  }
}
