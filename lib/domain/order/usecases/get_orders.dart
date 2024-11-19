import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';

import 'package:ecommerce_app/domain/order/repositories/order.dart';
import 'package:ecommerce_app/service_locator.dart';

class GetOrdersUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<OrderRepository>().getOrders();
  }
}
