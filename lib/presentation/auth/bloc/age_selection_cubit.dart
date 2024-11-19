import 'package:flutter_bloc/flutter_bloc.dart';

class AgeSelectionCubit extends Cubit<String> {
  AgeSelectionCubit() : super("Age Range");

  String selectionAge = ' ';

  void selectedAge(String age) {
    selectionAge = age;
    emit(selectionAge);
  }
}
