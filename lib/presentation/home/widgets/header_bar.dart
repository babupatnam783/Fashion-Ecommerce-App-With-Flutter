import 'package:ecommerce_app/common/helper/navigation/app_navigation.dart';
import 'package:ecommerce_app/core/configs/assets/app_images.dart';
import 'package:ecommerce_app/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_app/core/configs/themes/app_colors.dart';
import 'package:ecommerce_app/domain/auth/entity/user.dart';
import 'package:ecommerce_app/presentation/cart/pages/cart_page.dart';
import 'package:ecommerce_app/presentation/home/bloc/user_info/userinfo_cubit.dart';
import 'package:ecommerce_app/presentation/settings/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserinfoCubit()..displayUserInfo(),
      child: Padding(
        padding: const EdgeInsets.only(left: 16,top: 40,right: 16),
        child: BlocBuilder<UserinfoCubit, UserinfoDisplayState>(
          builder: (context, state) {
            if (state is UserinfoLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserinfoLoaded) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _profile(state.user, context),
                  _gender(state.user),
                  _shopBag(context),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _profile(UserEntity user, context) {
    return GestureDetector(
      onTap: () {
        AppNavigation.push(context, const SettingsPage());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: user.image.isEmpty
                    ? const AssetImage(AppImages.profileImg)
                    : NetworkImage(user.image),
                fit: BoxFit.cover),
            shape: BoxShape.circle),
      ),
    );
  }

  Widget _gender(UserEntity user) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Text(
          user.gender == 1 ? 'Men' : 'Women',
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }

  Widget _shopBag(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigation.push(context, const CartPage());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
            color: AppColors.primary, shape: BoxShape.circle),
        child: SvgPicture.asset(
          AppVectors.bagImg,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
