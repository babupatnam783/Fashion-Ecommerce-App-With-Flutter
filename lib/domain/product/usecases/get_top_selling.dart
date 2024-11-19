
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/domain/product/repositories/product_repository.dart';
import 'package:ecommerce_app/service_locator.dart';

class GetTopSellingUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<ProductRepository>().getTopSelling();
  }
}
