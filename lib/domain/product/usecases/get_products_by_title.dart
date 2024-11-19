import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/domain/product/repositories/product_repository.dart';
import 'package:ecommerce_app/service_locator.dart';

class GetProductsByTitleUseCase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<ProductRepository>().getProductsByTitle(params!);
  }
}