import 'package:ecommerce_app/core/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TitleAndSeeAll extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const TitleAndSeeAll({super.key, required this.title,this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: onTap,
          focusColor: AppColors.primary,
          child: const Text(
            "See All",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
