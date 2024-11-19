import 'package:ecommerce_app/domain/order/entities/product_ordered.dart';

class CartHelper {
  static double calculateCartSubtotal(List<ProductOrderedEntity> products) {
    double subTotalPrice = 0;
    for (var item in products) {
      subTotalPrice = subTotalPrice + item.totalPrice;
    }
    return subTotalPrice;
  }
}
