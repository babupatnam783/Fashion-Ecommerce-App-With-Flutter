
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/product/models/product.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByCategoryId(String categoryId);
  Future<Either> getProductsByTitle(String title);
  Future <Either> addOrRemoveFavoriteProduct(ProductEntity product);
  Future<bool> isFavourite(String productId);
  Future<Either> getFavouriteProducts();
}

class ProductFirebaseServiceImpl extends ProductFirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  @override
  Future<Either> getTopSelling() async {
    try {
      var returnedData = await _db
          .collection("Products")
          .where("salesNumber", isGreaterThanOrEqualTo: 20)
          .get();
      return Right(returnedData.docs.map((e)=>e.data()).toList().sublist(0,3));
    } catch (e) {
      return const Left("Please try again");
    }
  }
  
  @override
  Future<Either> getNewIn() async {
    try {
      var returnedData = await _db
          .collection("Products")
          .where("createdDate", isGreaterThanOrEqualTo: DateTime(2024,11,17))
          .get();
      return Right(
          returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left("Please try again");
    }
  }
  
  @override
  Future<Either> getProductsByCategoryId(String categoryId) async{
    try {
      var returnedData = await _db
          .collection("Products")
          .where("categoryId", isEqualTo:  categoryId)
          .get();
      return Right(
          returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left("Please try again");
    }
  }
  
  @override
  Future<Either> getProductsByTitle(String title) async{
   try {
      var returnedData = await _db
          .collection("Products")
          .where("title", isGreaterThanOrEqualTo:  title)
          .get();
      return Right(
          returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left("Please try again");
    }
  }

  @override
  Future <Either> addOrRemoveFavoriteProduct(ProductEntity product) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance.collection(
        "users"
      ).doc(user!.uid).collection('Favorites').where(
        'productId', isEqualTo: product.productId
      ).get();

      if (products.docs.isNotEmpty) {
        await products.docs.first.reference.delete();
        return const Right(false);
      } else {
        await FirebaseFirestore.instance.collection(
          "users"
        ).doc(user.uid).collection('Favorites').add(
          product.fromEntity().toMap()
        );
        return const Right(true);
      }

    } catch (e) {
      return const Left(
        'Please try again'
      );
    }
  }
  
  @override
  Future<bool> isFavourite(String productId)async {
   try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: productId)
          .get();

      if (products.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    } 
  }
  
  @override
  Future<Either> getFavouriteProducts()async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData = await _db
          .collection("users").doc(user!.uid)
          .collection("Favorites")
          .get();
      return Right(
          returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left("Please try again");
    }
  }
}
