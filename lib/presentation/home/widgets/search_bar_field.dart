import 'package:ecommerce_app/common/helper/navigation/app_navigation.dart';
import 'package:ecommerce_app/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_app/presentation/search/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBarField extends StatelessWidget {
  const SearchBarField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          readOnly: true,
          onTap: () {
             AppNavigation.push(context, const SearchPage());
          },
          decoration: InputDecoration(
            hintText: "Search...",
            contentPadding: const EdgeInsets.all(12),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none),
            prefixIcon: SvgPicture.asset(
              AppVectors.search,
              fit: BoxFit.none,
            ),
          ),
        ));
  }
}
