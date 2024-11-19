import 'package:ecommerce_app/common/widgets/appbar/basic_appbar.dart';
import 'package:ecommerce_app/domain/order/entities/product_ordered.dart';
import 'package:ecommerce_app/presentation/settings/widgets/ordered_product_card.dart';
import 'package:flutter/material.dart';

class OrderedItemsPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  const OrderedItemsPage({
    required this.products,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text(
          'Order Items'
        ),
      ),
      body: _products()
    );
  }

  Widget _products() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return OrderItemCard(
          productOrderedEntity: products[index] ,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10,),
      itemCount: products.length
    );
  }
}