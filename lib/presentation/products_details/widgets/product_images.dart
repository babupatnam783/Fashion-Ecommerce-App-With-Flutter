import 'package:ecommerce_app/common/helper/images/image_display.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductImages extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductImages({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        itemCount: productEntity.images.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (context, index) => const Gap(10),
        itemBuilder: (context, index) {
          return Container(
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(ImageDisplayHelper.generateProductImageURL(
                    productEntity.images[index])),
              ),
            ),
          );
        },
      ),
    );
  }
}
