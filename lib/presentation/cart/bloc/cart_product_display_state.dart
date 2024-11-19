import 'package:ecommerce_app/domain/order/entities/product_ordered.dart';

abstract class CartProductDisplayState {}

class CartProductDisplayintialState extends CartProductDisplayState {}

class CartProductDisplayLoading extends CartProductDisplayState {}

class CartProductDisplayLoaded extends CartProductDisplayState {
  final List<ProductOrderedEntity> products;
  CartProductDisplayLoaded({required this.products});
}

class FailureCartProductDisplay extends CartProductDisplayState {
  final String errorMessage;
  FailureCartProductDisplay({required this.errorMessage});
}
