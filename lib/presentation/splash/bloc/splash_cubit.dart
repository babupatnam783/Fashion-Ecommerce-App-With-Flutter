
import 'package:ecommerce_app/domain/auth/usecase/is_logged_in.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash_state.dart';



class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    await sl<IsLoggedInUseCase>().call() ? emit(Authenticated()):emit(UnAuthenticated());
    // emit(UnAuthenticated());
    // var isLoggedIn = await sl<IsloggedinUseCase>().call();

    // if (isLoggedIn) {
    //   emit(Authenticated());
    // } else {
    //   emit(UnAuthenticated());
    // }
  }
}
