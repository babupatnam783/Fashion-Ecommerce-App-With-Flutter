import 'package:ecommerce_app/core/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final  Function() onTap;
  const SettingTile({super.key,required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded
              )
        ],),
      ),
    );
  }
}