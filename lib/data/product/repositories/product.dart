
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/product/models/product.dart';
import 'package:ecommerce_app/data/product/source/product_firebase_service.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:ecommerce_app/domain/product/repositories/product_repository.dart';
import 'package:ecommerce_app/service_locator.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either> getTopSelling() async {
    var resultData = await sl<ProductFirebaseService>().getTopSelling();
    return resultData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data).map(
        (e) => ProductModel.fromMap(e).toEntity(),
      ).toList());
    });
  }
  
  @override
  Future<Either> getNewIn() async{
    var resultData = await sl<ProductFirebaseService>().getNewIn();
    return resultData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data).map(
        (e) => ProductModel.fromMap(e).toEntity(),
      ).toList());
    });
  }
  
  @override
  Future<Either> getProductsByCategoryId(String categoryId) async{
   var resultData = await sl<ProductFirebaseService>().getProductsByCategoryId(categoryId);
    return resultData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data).map(
        (e) => ProductModel.fromMap(e).toEntity(),
      ).toList());
    });
  }
  
  @override
  Future<Either> getProductsByTitle(String title) async{
   var resultData = await sl<ProductFirebaseService>().getProductsByTitle(title);
    return resultData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data).map(
        (e) => ProductModel.fromMap(e).toEntity(),
      ).toList());
    });
  }

  @override
  Future<Either> addOrRemoveFavouriteProduct(ProductEntity product) async{
    return await sl<ProductFirebaseService>().addOrRemoveFavoriteProduct(product);
  }
  
  @override
  Future<bool> isFavourite(String productId) async{
   return await sl<ProductFirebaseService>().isFavourite(productId);
  }
  
  @override
  Future<Either> getFavouriteProducts() async{
     var resultData = await sl<ProductFirebaseService>().getFavouriteProducts();
    return resultData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data).map(
        (e) => ProductModel.fromMap(e).toEntity(),
      ).toList());
    });
  }
}
