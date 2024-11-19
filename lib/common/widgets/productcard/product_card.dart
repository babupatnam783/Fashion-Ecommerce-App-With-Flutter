import 'package:ecommerce_app/common/helper/images/image_display.dart';
import 'package:ecommerce_app/common/helper/navigation/app_navigation.dart';
import 'package:ecommerce_app/core/configs/themes/app_colors.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:ecommerce_app/presentation/products_details/pages/products_details_page.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductCard({super.key,required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppNavigation.push(context,ProductsDetailsPage(productEntity: productEntity,));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                      ImageDisplayHelper.generateProductImageURL(productEntity.images[0])
                    )),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productEntity.title,
                      style: const TextStyle(
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w300),
                    ),
                    Row(
                      children: [
                        Text(
                          productEntity.discountedPrice == 0 ? "${productEntity.price}\$" :
                            "${productEntity.discountedPrice}\$",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                           productEntity.discountedPrice == 0 ? '' :
                              "${productEntity.price}\$",
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
