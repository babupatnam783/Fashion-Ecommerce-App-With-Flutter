import 'package:ecommerce_app/domain/order/usecases/get_orders.dart';
import 'package:ecommerce_app/presentation/settings/bloc/orders_display_state.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersDisplayCubit extends Cubit<OrdersDisplayState> {
  OrdersDisplayCubit() : super(OrdersDisplayLoading());

  void displayOrders() async {
    var ordersData = await sl<GetOrdersUseCase>().call();
    ordersData.fold((error) {
      emit(FailureOrdersDisplay(errorMessage: error));
    }, (data) {
      emit(OrdersDisplayLoaded(orders: data));
    });
  }
}
