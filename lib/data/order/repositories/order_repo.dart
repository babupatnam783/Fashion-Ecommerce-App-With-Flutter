import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/order/models/add_to_cart_req.dart';
import 'package:ecommerce_app/data/order/models/order.dart';
import 'package:ecommerce_app/data/order/models/order_registration_req.dart';
import 'package:ecommerce_app/data/order/models/product_order.dart';
import 'package:ecommerce_app/data/order/source/order_firebase_service.dart';
import 'package:ecommerce_app/domain/order/repositories/order.dart';
import 'package:ecommerce_app/service_locator.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    return await sl<OrderFirebaseService>().addToCart(addToCartReq);
  }

  @override
  Future<Either> getCartProducts() async {
    var returnedData = await sl<OrderFirebaseService>().getCartProducts();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductOrderedModel.fromMap(e).toEntity())
          .toList());
    });
  }
  
  @override
  Future<Either> removeCartProduct(String id) async{
    return await sl<OrderFirebaseService>().removeCartProduct(id);
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReq order)async {
    return await sl<OrderFirebaseService>().orderRegistration(order);
  }
  
  @override
  Future<Either> getOrders() async{
   var returnedData = await sl<OrderFirebaseService>().getOrders();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => OrderModel.fromMap(e).toEntity())
          .toList());
    });
  }
}
