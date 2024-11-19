import 'package:ecommerce_app/common/helper/navigation/app_navigation.dart';
import 'package:ecommerce_app/common/widgets/appbar/basic_appbar.dart';
import 'package:ecommerce_app/presentation/settings/pages/my_favourite_page.dart';
import 'package:ecommerce_app/presentation/settings/pages/my_orders_page.dart';
import 'package:ecommerce_app/presentation/settings/widgets/setting_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const BasicAppbar(title: Text("Settings"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
          SettingTile(title: "My Favourites",onTap: (){AppNavigation.push(context, const MyFavouritePage());},),
          const Gap(10),
          SettingTile(title: "My Orders",onTap: (){AppNavigation.push(context, const MyOrdersPage());},)
        ],),
      ),
    );
  }
}