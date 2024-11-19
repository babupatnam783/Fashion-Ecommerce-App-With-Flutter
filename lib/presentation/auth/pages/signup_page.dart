import 'package:ecommerce_app/common/helper/navigation/app_navigation.dart';
import 'package:ecommerce_app/common/widgets/appbar/basic_appbar.dart';
import 'package:ecommerce_app/common/widgets/button/basic_button.dart';
import 'package:ecommerce_app/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_app/presentation/auth/pages/gender_and_age_selection.dart';
import 'package:ecommerce_app/presentation/auth/pages/signin_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController _firstNameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppbar(
          hideBack: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _signUpText(),
              const SizedBox(
                height: 20,
              ),
              _firstNameTextField(),
              const SizedBox(
                height: 20,
              ),
              _lastNameTextField(),
              const SizedBox(
                height: 20,
              ),
              _emailTextField(),
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
              _createAccount(context),
            ],
          ),
        ));
  }

  Widget _signUpText() {
    return const Text(
      "Create Account",
      style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold),
    );
  }

  Widget _firstNameTextField() {
    return TextField(
      controller: _firstNameCon,
      decoration: const InputDecoration(hintText: "Firstname"),
    );
  }

  Widget _lastNameTextField() {
    return TextField(
      controller: _lastNameCon,
      decoration: const InputDecoration(hintText: "Lastname"),
    );
  }

  Widget _emailTextField() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(hintText: "Email"),
    );
  }

  Widget _passwordTextField() {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(hintText: "Password"),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigation.push(
            context,
            GenderAndAgeSelectionPage(
              userCreationReq: UserCreationReq(
                  firstName: _firstNameCon.text,
                  lastName: _lastNameCon.text,
                  email: _emailCon.text,
                  password: _passwordCon.text,
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
          const TextSpan(text: "Do you have an account?"),
          TextSpan(
              text: " Sign In",
              style: const TextStyle(fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()..onTap = () {
                AppNavigation.pushReplacement(context,  SigninPage());
              }),
        ],
      ),
    );
  }
}
