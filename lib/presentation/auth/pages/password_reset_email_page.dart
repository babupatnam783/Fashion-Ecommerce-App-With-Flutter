import 'package:ecommerce_app/common/helper/navigation/app_navigation.dart';
import 'package:ecommerce_app/common/widgets/button/basic_button.dart';
import 'package:ecommerce_app/core/configs/assets/app_vectors.dart';
import 'package:ecommerce_app/presentation/auth/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class PasswordResetEmailPage extends StatelessWidget {
  const PasswordResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppVectors.emailSending),
            const Gap(30),
            const Text("We sent you an Email to reset your password",style: TextStyle(fontSize: 16),),
            const Gap(30),
            SizedBox(
              width: 200,
              child: BasicAppButton(onPressed: (){
                AppNavigation.pushReplacement(context, SigninPage());
              },title: "Return to Login",))
          ],
        ),
      ),
    );
  }
}