import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/order/models/add_to_cart_req.dart';
import 'package:ecommerce_app/data/order/models/order_registration_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class OrderFirebaseService {
  Future<Either> addToCart(AddToCartReq addToCartReq);
  Future<Either> getCartProducts();
  Future<Either> removeCartProduct(String id);
  Future<Either> orderRegistration(OrderRegistrationReq order);
  Future<Either> getOrders();
}

class OrderFirebaseServiceImpl extends OrderFirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    try {
      User? user = _auth.currentUser;
      await _db
          .collection('users')
          .doc(user!.uid)
          .collection('Cart')
          .add(addToCartReq.toMap());
      return const Right("Add to cart was successfully");
    } catch (e) {
      return const Left("Please try again");
    }
  }

  @override
  Future<Either> getCartProducts() async {
    try {
      User? user = _auth.currentUser;
      var getCartProducts =
          await _db.collection('users').doc(user!.uid).collection('Cart').get();
      List<Map> products=[];
      for(var item in getCartProducts.docs){
        var  data = item.data();
        data.addAll({"id":item.id});
        products.add(data);
      }
      return Right(products);
    } catch (e) {
      return const Left("Please try again");
    }
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    try {
      User? user = _auth.currentUser;
      await _db
          .collection('users')
          .doc(user!.uid)
          .collection('Cart')
          .doc(id)
          .delete();

      return const Right("Product removed successfully");
    } catch (e) {
      return const Left("Please try again");
    }
  }
  
  @override
  Future<Either> orderRegistration(order) async{
    try {
      User? user = _auth.currentUser;
      await _db
          .collection('users')
          .doc(user!.uid)
          .collection('Orders')
          .add(order.toMap());
        for (var item in order.products) {
        await  _db
            .collection('users')
            .doc(user.uid)
            .collection('Cart')
            .doc(item.id)
            .delete();
      }

      return const Right("Order registered successfully");
    } catch (e) {
      return const Left("Please try again");
    }
  }
  
  @override
  Future<Either> getOrders()async {
      try {
      User? user = _auth.currentUser;
      var orders= await _db
          .collection('users')
          .doc(user!.uid)
          .collection('Orders').get();
      return  Right(List.from(orders.docs).map((e)=>e.data()).toList());
    } catch (e) {
      return const Left("Please try again");
    }
   
  }
}
