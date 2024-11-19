import 'package:ecommerce_app/common/helper/navigation/app_navigation.dart';
import 'package:ecommerce_app/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_app/core/configs/themes/app_colors.dart';
import 'package:ecommerce_app/presentation/auth/pages/signin_page.dart';
import 'package:ecommerce_app/presentation/home/pages/home_page.dart';
import 'package:ecommerce_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:ecommerce_app/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplahPage extends StatelessWidget {
  const SplahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if(state is UnAuthenticated){
            AppNavigation.pushReplacement(context,  SigninPage());
          }
          if(state is Authenticated){
            AppNavigation.pushReplacement(context, const HomePage());
          }
        },
        child: Center(
          child: SvgPicture.asset(AppVectors.logo),
        ),
      ),
    );
  }
}
