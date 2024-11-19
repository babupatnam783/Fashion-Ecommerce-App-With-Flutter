import 'package:ecommerce_app/common/bloc/button/button_cubit.dart';
import 'package:ecommerce_app/common/bloc/button/button_state.dart';
import 'package:ecommerce_app/common/helper/navigation/app_navigation.dart';
import 'package:ecommerce_app/common/widgets/appbar/basic_appbar.dart';
import 'package:ecommerce_app/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce_app/data/auth/models/signin_user_req.dart';
import 'package:ecommerce_app/domain/auth/usecase/signin.dart';
import 'package:ecommerce_app/presentation/auth/pages/forgot_password_page.dart';
import 'package:ecommerce_app/presentation/home/pages/home_page.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordPage extends StatelessWidget {
  final SigninUserReq signInUseReq;
  PasswordPage({super.key, required this.signInUseReq});

  final TextEditingController _passwordContr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppbar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: BlocProvider(
            create: (context) => ButtonStateCubit(),
            child: BlocListener<ButtonStateCubit, ButtonState>(
              listener: (context, state) {
                if (state is ButtonFailureState) {
                  SnackBar snackBar = SnackBar(
                    content: Text(state.errorMessage),
                    behavior: SnackBarBehavior.floating,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                if (state is ButtonSuccessState) {
                  AppNavigation.pushReplacement(context, const HomePage());
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _signInText(),
                  const SizedBox(
                    height: 20,
                  ),
                  _passwordTextField(),
                  const SizedBox(
                    height: 20,
                  ),
                  _continueButton(context),
                  const SizedBox(
                    height: 18,
                  ),
                  _forgotPassword(context),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _signInText() {
    return const Text(
      "Sign in",
      style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold),
    );
  }

  Widget _passwordTextField() {
    return TextField(
      controller: _passwordContr,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "Password",
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          signInUseReq.password = _passwordContr.text;
          context
              .read<ButtonStateCubit>()
              .execute(usecase: sl<SignInUseCase>(), params: signInUseReq);
        },
        title: "Continue",
      );
    });
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(text: "Forgot password?"),
        TextSpan(
            text: " Reset",
            style: const TextStyle(fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigation.push(context, ForgotPasswordPage());
              }),
      ]),
    );
  }
}
