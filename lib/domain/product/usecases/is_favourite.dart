import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/domain/product/repositories/product_repository.dart';
import 'package:ecommerce_app/service_locator.dart';

class IsFavouriteUseCase extends Usecase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<ProductRepository>().isFavourite(params!);
  }
}