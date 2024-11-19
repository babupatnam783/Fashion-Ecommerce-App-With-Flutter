import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductTitle({super.key,required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(productEntity.title,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
    );
  }
}