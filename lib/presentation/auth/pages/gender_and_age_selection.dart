import 'package:ecommerce_app/common/bloc/button/button_cubit.dart';
import 'package:ecommerce_app/common/bloc/button/button_state.dart';
import 'package:ecommerce_app/common/helper/bottom_sheet/app_bottom_sheet.dart';
import 'package:ecommerce_app/common/helper/navigation/app_navigation.dart';
import 'package:ecommerce_app/common/widgets/appbar/basic_appbar.dart';
import 'package:ecommerce_app/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce_app/core/configs/themes/app_colors.dart';
import 'package:ecommerce_app/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_app/domain/auth/usecase/signup.dart';
import 'package:ecommerce_app/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:ecommerce_app/presentation/auth/bloc/agesdisplay/ages_display_cubit.dart';
import 'package:ecommerce_app/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:ecommerce_app/presentation/auth/widgets/ages.dart';
import 'package:ecommerce_app/presentation/home/pages/home_page.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  final UserCreationReq userCreationReq;
  const GenderAndAgeSelectionPage({super.key, required this.userCreationReq});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectionCubit()),
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => AgesDisplayCubit()..displayAges()),
          BlocProvider(create: (context) => ButtonStateCubit()),
        ],
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if(state is ButtonFailureState){
              SnackBar snackBar = SnackBar(content:Text(state.errorMessage),behavior: SnackBarBehavior.floating, );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if(state is ButtonSuccessState){
              AppNavigation.pushReplacement(context, const HomePage());
            }
          },
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Tell us About yourself",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    const Gap(10),
                    const Text(
                      "Who do you shop for?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const Gap(30),
                    _genders(context),
                    const Gap(30),
                    const Text(
                      "How old are you?",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const Gap(30),
                    _age(context),
                  ],
                ),
              ),
              const Spacer(),
              _finishButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100,
      color: AppColors.secondBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Builder(builder: (context) {
          return BasicReactiveButton(
              onPressed: () {
                userCreationReq.gender =
                    context.read<GenderSelectionCubit>().selectedIndex;
                userCreationReq.age =
                    context.read<AgeSelectionCubit>().selectionAge;
                context.read<ButtonStateCubit>().execute(
                    usecase: sl<SignUpUseCase>(), params: userCreationReq);
              },
              title: 'Finish');
        }),
      ),
    );
  }
}

Widget _genders(BuildContext context) {
  return BlocBuilder<GenderSelectionCubit, int>(builder: (context, state) {
    return Row(
      children: [
        genderTile(context, 1, "Male"),
        const Gap(20),
        genderTile(context, 2, "Women")
      ],
    );
  });
}

Widget genderTile(BuildContext context, int genderIndex, String gender) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        context.read<GenderSelectionCubit>().selectGender(genderIndex);
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: context.read<GenderSelectionCubit>().state == genderIndex
                ? AppColors.primary
                : AppColors.secondBackground,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            gender,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ),
    ),
  );
}

Widget _age(BuildContext context) {
  return BlocBuilder<AgeSelectionCubit, String>(builder: (context, state) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(
          context,
          MultiBlocProvider(providers: [
            BlocProvider.value(
              value: context.read<AgeSelectionCubit>(),
            ),
            BlocProvider.value(
                value: context.read<AgesDisplayCubit>()..displayAges())
          ], child: const Ages()),
        );
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(state), const Icon(Icons.keyboard_arrow_down)],
        ),
      ),
    );
  });
}
