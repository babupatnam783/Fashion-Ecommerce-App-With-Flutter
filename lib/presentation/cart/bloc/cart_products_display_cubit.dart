import 'package:ecommerce_app/domain/order/usecases/get_cart_products.dart';
import 'package:ecommerce_app/domain/order/usecases/remove_cart_product.dart';
import 'package:ecommerce_app/presentation/cart/bloc/cart_product_display_state.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductsDisplayCubit extends Cubit<CartProductDisplayState> {
  CartProductsDisplayCubit() : super(CartProductDisplayintialState());

  void displayCartProducts() async {
    emit(CartProductDisplayLoading());
    var resultData = await sl<GetCartProductsUseCase>().call();
    resultData.fold((error) {
      emit(FailureCartProductDisplay(errorMessage: error));
    }, (data) {
      emit(CartProductDisplayLoaded(products: data));
    });
  }

  void removeProduct(String id) async {
    emit(CartProductDisplayLoading());
    var resultData = await sl<RemoveCartProductsUseCase>().call(params: id);
    resultData.fold((error) {
      emit(FailureCartProductDisplay(errorMessage: error));
    }, (data) {
      displayCartProducts();
    });
  }
}
