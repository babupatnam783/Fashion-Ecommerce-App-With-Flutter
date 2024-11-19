import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';

import 'package:ecommerce_app/domain/order/repositories/order.dart';
import 'package:ecommerce_app/service_locator.dart';

class RemoveCartProductsUseCase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<OrderRepository>().removeCartProduct(params!);
  }
}
