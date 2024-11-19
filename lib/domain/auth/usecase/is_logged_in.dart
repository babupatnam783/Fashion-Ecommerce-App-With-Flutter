
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/domain/auth/repository/auth.dart';
import 'package:ecommerce_app/service_locator.dart';

class IsLoggedInUseCase extends Usecase <bool,dynamic> {
  @override
  Future<bool> call({params}) async{
    return await sl<AuthRepository>().isLoggedIn();
  }

}