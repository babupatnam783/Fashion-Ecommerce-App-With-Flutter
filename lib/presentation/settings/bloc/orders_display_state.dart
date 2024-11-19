import 'package:ecommerce_app/domain/order/entities/order.dart';

abstract class OrdersDisplayState {}

class OrdersDisplayLoading extends OrdersDisplayState {}

class OrdersDisplayLoaded extends OrdersDisplayState {
  final List<OrderEntity> orders;
  OrdersDisplayLoaded({required this.orders});
}

class FailureOrdersDisplay extends OrdersDisplayState {
  final String errorMessage;
  FailureOrdersDisplay({required this.errorMessage});
}
