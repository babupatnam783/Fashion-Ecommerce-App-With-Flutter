import 'package:ecommerce_app/common/helper/navigation/app_navigation.dart';
import 'package:ecommerce_app/common/widgets/appbar/basic_appbar.dart';
import 'package:ecommerce_app/core/configs/themes/app_colors.dart';
import 'package:ecommerce_app/domain/order/entities/order.dart';
import 'package:ecommerce_app/presentation/settings/pages/ordered_items_display.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderDetailsPage extends StatelessWidget {
  final OrderEntity orderEntity;
  const OrderDetailsPage({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Text('Order #${orderEntity.code}'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _status(),
            const Gap(50),
          _orderItems(context), 
          const Gap(30),
          _shipping()],
        ),
      ),
    );
  }
   Widget _status() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: orderEntity.orderStatus[index].done ? 
                    AppColors.primary :
                    Colors.white,
                    shape: BoxShape.circle
                  ),
                  child: orderEntity.orderStatus[index].done ? const Icon(
                    Icons.check
                  )  : Container(),
                ),
                const SizedBox(width: 15,),
                Text(
                  orderEntity.orderStatus[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: orderEntity.orderStatus[index].done ? Colors.white : Colors.grey
                  ),
                )
              ],
            ),
            Text(
              orderEntity.orderStatus[index].createdDate.toDate().toString().split(' ')[0],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: orderEntity.orderStatus[index].done ? Colors.white : Colors.grey
              ),
            )
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 50,), 
      reverse: true,
      itemCount: orderEntity.orderStatus.length
    );
   }

  Widget _orderItems(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order Items',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const Gap(15),
        Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.receipt_rounded),
                  Gap(20),
                  Text(
                    "4 Items",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              TextButton(
                onPressed: () {
                  AppNavigation.push(context,OrderedItemsPage(products: orderEntity.products));
                },
                child: const Text(
                  "View all",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.primary),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _shipping() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Shipping details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.secondBackground,
                borderRadius: BorderRadius.circular(10)),
            child: Text(orderEntity.shippingAddress))
      ],
    );
  }
}
