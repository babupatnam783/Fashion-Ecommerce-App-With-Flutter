
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/data/order/models/add_to_cart_req.dart';
import 'package:ecommerce_app/domain/order/repositories/order.dart';
import 'package:ecommerce_app/service_locator.dart';

class AddToCartUseCase extends Usecase<Either, AddToCartReq> {
  @override
  Future<Either> call({AddToCartReq? params}) async{
    return await sl<OrderRepository>().addToCart(params!);
  }
}
