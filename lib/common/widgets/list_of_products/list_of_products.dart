import 'package:ecommerce_app/common/widgets/productcard/product_card.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:flutter/material.dart';

class ListOfProducts extends StatelessWidget {
  final List<ProductEntity> products;
  const ListOfProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.6),
      itemBuilder: (context, index) {
        return ProductCard(productEntity: products[index]);
      },
    );
  }
}
