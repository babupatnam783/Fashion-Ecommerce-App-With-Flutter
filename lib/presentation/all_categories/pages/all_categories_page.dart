import 'package:ecommerce_app/common/bloc/categories/categories_display_cubit.dart';
import 'package:ecommerce_app/common/bloc/categories/categories_display_state.dart';
import 'package:ecommerce_app/common/helper/images/image_display.dart';
import 'package:ecommerce_app/common/helper/navigation/app_navigation.dart';
import 'package:ecommerce_app/common/widgets/appbar/basic_appbar.dart';
import 'package:ecommerce_app/core/configs/themes/app_colors.dart';
import 'package:ecommerce_app/presentation/category_products/pages/category_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: BlocProvider(
        create: (context) => CategoriesDisplayCubit()..displayCategories(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              const Text(
                "Shop by Categories",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              _categories(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categories() {
    return BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
      builder: (context, state) {
        if(state is CategoriesLoading){
          return const Center(child: CircularProgressIndicator());
        }
        if(state is CategoriesLoaded){
          return ListView.separated(
            itemCount: state.categories.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) => const Gap(10),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){AppNavigation.push(context, CategoryProductsPage(categoryEntity: state.categories[index],),);},
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: AppColors.secondBackground,
                      borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            // fit: BoxFit.fill,
                            image: NetworkImage(
                              ImageDisplayHelper.generateCategoryImageURL(
                                  state.categories[index].image),
                            ),
                          ),
                        ),
                      ),
                      const Gap(20),
                      Text(
                        state.categories[index].title,
                        style:
                            const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
