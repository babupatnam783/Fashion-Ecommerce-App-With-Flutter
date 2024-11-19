import 'package:ecommerce_app/domain/product/entities/product.dart';

class ProductPriceHelper {

 static double provideCurrentPrice(ProductEntity product) {
    return product.discountedPrice != 0 ? 
    product.discountedPrice.toDouble() : 
    product.price.toDouble();
  }

  
}