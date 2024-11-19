
import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:ecommerce_app/domain/product/usecases/add_or_remove_favourite_product.dart';
import 'package:ecommerce_app/domain/product/usecases/is_favourite.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteIconCubit  extends Cubit<bool>
{
  FavouriteIconCubit():super(false);

  void isFavourite(String productId) async {
    var result = await sl<IsFavouriteUseCase>().call(params: productId);
    emit(result);
  }

  void onTap(ProductEntity productEntity)async {
    var resultData= await sl<AddOrRemoveFavouriteProductUseCase>().call(params: productEntity);
    resultData.fold((error){}, (data){emit(data);});
  }
  
  
}