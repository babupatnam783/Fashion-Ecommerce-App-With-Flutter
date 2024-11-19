import 'package:ecommerce_app/core/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderTile extends StatelessWidget {
  final String code;
  final String itemsCount;
  final  Function() onTap;
  const OrderTile({super.key,required this.code,required this.onTap,required this.itemsCount});

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
          Row(
            children: [
              const Icon(Icons.receipt_rounded),
              const Gap(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Order #$code',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16
                        ),
                      ),
                      Expanded(
                        child: Text(
                         '$itemsCount item',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12
                          ),
                        ),
                      ),
                ],
              ),
            ],
          ),
              const Icon(
                Icons.arrow_forward_ios_rounded
              )
        ],),
      ),
    );
  }
}