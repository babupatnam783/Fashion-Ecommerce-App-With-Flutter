
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/product/entities/product.dart';

abstract class ProductRepository {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByCategoryId(String categoryId);
  Future<Either> getProductsByTitle(String title);
  Future<Either> addOrRemoveFavouriteProduct(ProductEntity product);
  Future<bool> isFavourite(String productId);
  Future<Either> getFavouriteProducts();
}