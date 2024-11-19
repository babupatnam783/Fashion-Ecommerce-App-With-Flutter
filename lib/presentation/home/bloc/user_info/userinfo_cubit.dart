import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/auth/entity/user.dart';
import 'package:ecommerce_app/domain/auth/usecase/get_user.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:meta/meta.dart';

part 'userinfo_state.dart';

class UserinfoCubit extends Cubit<UserinfoDisplayState> {
  UserinfoCubit() : super(UserinfoDisplayInitial());

  void displayUserInfo() async {
    var returnedData = await sl<GetUserUseCase>().call();
    return returnedData.fold((error) {
      emit(UserinfoFailure());
    }, (data) {
      emit(UserinfoLoaded(user: data));
    });
  }
}
