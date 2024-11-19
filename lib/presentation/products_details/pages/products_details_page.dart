import 'package:ecommerce_app/common/bloc/button/button_cubit.dart';
import 'package:ecommerce_app/common/widgets/appbar/basic_appbar.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:ecommerce_app/presentation/products_details/bloc/favourite_icon_cubit.dart';
import 'package:ecommerce_app/presentation/products_details/bloc/product_color_selection.dart';
import 'package:ecommerce_app/presentation/products_details/bloc/product_quantity.dart';
import 'package:ecommerce_app/presentation/products_details/bloc/product_size_selection.dart';
import 'package:ecommerce_app/presentation/products_details/widgets/add_to_bag.dart';
import 'package:ecommerce_app/presentation/products_details/widgets/favourite_button.dart';
import 'package:ecommerce_app/presentation/products_details/widgets/product_images.dart';
import 'package:ecommerce_app/presentation/products_details/widgets/product_price.dart';
import 'package:ecommerce_app/presentation/products_details/widgets/product_quantity.dart';
import 'package:ecommerce_app/presentation/products_details/widgets/product_title.dart';
import 'package:ecommerce_app/presentation/products_details/widgets/selected_color.dart';
import 'package:ecommerce_app/presentation/products_details/widgets/selected_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductsDetailsPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductsDetailsPage({super.key,required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>ProductQuantityCubit()),
        BlocProvider(create: (context)=>ButtonStateCubit()),
        BlocProvider(create: (context)=> ProductColorSelectionCubit()),
        BlocProvider(create: (context)=> ProductSizeSelectionCubit()),
        BlocProvider(create: (context)=> FavouriteIconCubit()..isFavourite(productEntity.productId)),
        
      ],
      child: Scaffold(
        appBar: BasicAppbar(hideBack: false,action:  FavouriteButton(productEntity: productEntity,),),
        bottomNavigationBar: AddToBag(productEntity: productEntity),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImages(productEntity: productEntity),
              const Gap(10),
              ProductTitle(productEntity: productEntity),
              const Gap(10),
              ProductPrice(productEntity: productEntity),
              const Gap(10),
              SelectedSize(productEntity: productEntity,),
              const Gap(10),
              SelectedColor(productEntity: productEntity,),
              const Gap(10),
              ProductQuantity()
            ],
          ),
        ),
      ),
    );
  }
}