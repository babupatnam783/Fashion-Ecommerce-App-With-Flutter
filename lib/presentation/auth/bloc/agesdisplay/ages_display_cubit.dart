import 'package:ecommerce_app/domain/auth/usecase/get_ages.dart';
import 'package:ecommerce_app/presentation/auth/bloc/agesdisplay/ages_display_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {
  AgesDisplayCubit() : super(AgesDisplayLoading());

  void displayAges() async {
    var returnedData = await sl<GetAgesUseCase>().call();

    returnedData.fold((error) {
      emit(AgesDisplayLoadFailure(message: error));
    }, (data) {
      emit(AgesDisplayLoaded(ages: data));
    });
  }
}
