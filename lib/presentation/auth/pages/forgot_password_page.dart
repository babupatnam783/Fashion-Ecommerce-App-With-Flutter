import 'package:ecommerce_app/common/bloc/button/button_cubit.dart';
import 'package:ecommerce_app/common/bloc/button/button_state.dart';
import 'package:ecommerce_app/common/helper/navigation/app_navigation.dart';
import 'package:ecommerce_app/common/widgets/appbar/basic_appbar.dart';
import 'package:ecommerce_app/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce_app/domain/auth/usecase/password_reset_email.dart';
import 'package:ecommerce_app/presentation/auth/pages/password_reset_email_page.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final TextEditingController _emailCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppbar(),
        body: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
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
                  AppNavigation.push(context, const PasswordResetEmailPage());
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _forgotPasswordText(),
                  const SizedBox(
                    height: 20,
                  ),
                  _emailTextField(),
                  const SizedBox(
                    height: 20,
                  ),
                  _continueButton(context),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _forgotPasswordText() {
    return const Text(
      "Forgot Password",
      style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailTextField() {
    return TextField(
      controller: _emailCont,
      decoration: const InputDecoration(
        hintText: "Email",
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                usecase: sl<PasswordResetEmailUseCase>(), params: _emailCont.text);
          },
          title: "Continue",
        );
      }
    );
  }
}
