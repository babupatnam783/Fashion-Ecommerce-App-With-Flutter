import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/data/order/models/order_registration_req.dart';
import 'package:ecommerce_app/domain/order/repositories/order.dart';
import 'package:ecommerce_app/service_locator.dart';

class OrderRegistrationUseCase extends Usecase<Either, OrderRegistrationReq> {
  @override
  Future<Either> call({OrderRegistrationReq? params}) async {
    return await sl<OrderRepository>().orderRegistration(params!);
  }
}
