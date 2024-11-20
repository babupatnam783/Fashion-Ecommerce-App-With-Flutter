import 'package:ecommerce_app/common/bloc/categories/categories_display_cubit.dart';
import 'package:ecommerce_app/common/bloc/categories/categories_display_state.dart';
import 'package:ecommerce_app/common/helper/images/image_display.dart';
import 'package:ecommerce_app/common/helper/navigation/app_navigation.dart';
import 'package:ecommerce_app/domain/category/entity/category.dart';
import 'package:ecommerce_app/presentation/all_categories/pages/all_categories_page.dart';
import 'package:ecommerce_app/presentation/category_products/pages/category_products.dart';
import 'package:ecommerce_app/presentation/home/widgets/title_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return const CircularProgressIndicator();
            }
            if (state is CategoriesLoaded) {
              return Column(
                children: [
                  TitleAndSeeAll(
                    title: "Categories",
                    onTap: () {
                      AppNavigation.push(context, const AllCategoriesPage());
                    },
                  ),
                  const Gap(20),
                  _categories(state.categories),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _categories(List<CategoryEntity> categories) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const Gap(15),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  AppNavigation.push(context,
                      CategoryProductsPage(categoryEntity: categories[index]));
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          ImageDisplayHelper.generateCategoryImageURL(
                              categories[index].image)),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                categories[index].title,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              )
            ],
          );
        },
      ),
    );
  }
}
