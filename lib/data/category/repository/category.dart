import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/category/models/category.dart';
import 'package:ecommerce_app/data/category/source/category_service.dart';
import 'package:ecommerce_app/domain/category/repository/category.dart';
import 'package:ecommerce_app/service_locator.dart';

class CategoryRepoImpl extends CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var returnedData = await sl<CategoryFirebaseService>().getCategories();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data).map((e) => CategoryModel.fromMap(e).toEntity()).toList());
    });
  }
}
