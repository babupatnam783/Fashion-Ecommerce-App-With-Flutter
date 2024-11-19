import 'package:ecommerce_app/common/helper/navigation/app_navigation.dart';
import 'package:ecommerce_app/common/widgets/appbar/basic_appbar.dart';
import 'package:ecommerce_app/domain/order/entities/order.dart';
import 'package:ecommerce_app/presentation/settings/bloc/orders_display_cubit.dart';
import 'package:ecommerce_app/presentation/settings/bloc/orders_display_state.dart';
import 'package:ecommerce_app/presentation/settings/pages/order_details_page.dart';
import 'package:ecommerce_app/presentation/settings/widgets/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text("My Orders"),
      ),
      body: BlocProvider(
        create: (context) => OrdersDisplayCubit()..displayOrders(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<OrdersDisplayCubit, OrdersDisplayState>(
            builder: (context, state) {
              if (state is OrdersDisplayLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is OrdersDisplayLoaded) {
                return _listOfOrders(state.orders);
              }
              if (state is FailureOrdersDisplay) {
                return Center(
                  child: Text(state.errorMessage),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget _listOfOrders(List<OrderEntity> orders) {
    return ListView.separated(
      itemCount: orders.length,
      separatorBuilder: (context, index) => const Gap(15),
      itemBuilder: (context, index) {
        return OrderTile(
          code: orders[index].code,
          onTap: () {
            AppNavigation.push(context, OrderDetailsPage(orderEntity: orders[index],));
          },
          itemsCount: orders[index].products.length.toString(),
        );
      },
    );
  }
}
