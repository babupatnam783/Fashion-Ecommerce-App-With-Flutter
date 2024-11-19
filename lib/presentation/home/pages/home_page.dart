import 'package:ecommerce_app/presentation/home/widgets/categories.dart';
import 'package:ecommerce_app/presentation/home/widgets/header_bar.dart';
import 'package:ecommerce_app/presentation/home/widgets/new_in_products.dart';
import 'package:ecommerce_app/presentation/home/widgets/search_bar_field.dart';
import 'package:ecommerce_app/presentation/home/widgets/top_selling.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderBar(),
            const Gap(24),
            SearchBarField(),
            const Gap(24),
            Categories(),
            const Gap(24),
            TopSelling(),
            const Gap(24),
            NewInProducts()
          ],
        ),
      ),);
  }
}
