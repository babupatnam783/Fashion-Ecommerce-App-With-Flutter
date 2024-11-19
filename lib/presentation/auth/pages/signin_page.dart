import 'package:ecommerce_app/common/helper/navigation/app_navigation.dart';
import 'package:ecommerce_app/common/widgets/appbar/basic_appbar.dart';
import 'package:ecommerce_app/common/widgets/button/basic_button.dart';
import 'package:ecommerce_app/data/auth/models/signin_user_req.dart';
import 'package:ecommerce_app/presentation/auth/pages/password_page.dart';
import 'package:ecommerce_app/presentation/auth/pages/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: true,),
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _signInText(),
          const SizedBox(
            height: 20,
          ),
          _emailTextField(),
          const SizedBox(
            height: 20,
          ),
          _continueButton(context),
          const SizedBox(
            height: 18,
          ),
          _createAccount(context),
        ],
      ),
    ));
  }

  Widget _signInText() {
    return const Text(
      "Sign in",
      style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailTextField() {
    return  TextField(
      controller: _emailCon,
      decoration: InputDecoration(hintText: "Email"),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigation.push(
            context,
            PasswordPage(
              signInUseReq: SigninUserReq(
                email: _emailCon.text,
              ),
            ));
      },
      title: "Continue",
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "Don't  have an account?"),
          TextSpan(
              text: " Create one",
              style: const TextStyle(fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()..onTap = () {
                AppNavigation.push(context,  SignupPage());
              }),
        ],
      ),
    );
  }
}
