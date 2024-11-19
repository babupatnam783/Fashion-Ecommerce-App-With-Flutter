import 'package:ecommerce_app/common/bloc/product/product_display_cubit.dart';
import 'package:ecommerce_app/common/bloc/product/product_display_state.dart';
import 'package:ecommerce_app/common/widgets/appbar/basic_appbar.dart';
import 'package:ecommerce_app/common/widgets/list_of_products/list_of_products.dart';
import 'package:ecommerce_app/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_app/domain/product/usecases/get_products_by_title.dart';
import 'package:ecommerce_app/presentation/search/widgets/search_field.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsDisplayCubit(useCase: sl<GetProductsByTitleUseCase>()),
      child: Scaffold(
        appBar: BasicAppbar(
          height: 80,
          title: SearchField(),
        ),
        body: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductsLoaded) {
              return state.products.isEmpty
                  ? _notFound()
                  : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListOfProducts(products: state.products),
                  );
            }
            return Container();
          },
        ),
      ),
    );
  }

 Widget _notFound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppVectors.notFound,
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Sorry, we couldn't find any matching result for your Search.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
            ),
          ),
        )
      ],
    );
  }
}
