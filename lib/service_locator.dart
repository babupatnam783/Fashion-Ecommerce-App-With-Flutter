import 'package:ecommerce_app/data/auth/repository/auth.dart';
import 'package:ecommerce_app/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce_app/data/category/repository/category.dart';
import 'package:ecommerce_app/data/category/source/category_service.dart';
import 'package:ecommerce_app/data/order/repositories/order_repo.dart';
import 'package:ecommerce_app/data/order/source/order_firebase_service.dart';
import 'package:ecommerce_app/data/product/repositories/product.dart';
import 'package:ecommerce_app/data/product/source/product_firebase_service.dart';
import 'package:ecommerce_app/domain/auth/repository/auth.dart';
import 'package:ecommerce_app/domain/auth/usecase/get_ages.dart';
import 'package:ecommerce_app/domain/auth/usecase/get_user.dart';
import 'package:ecommerce_app/domain/auth/usecase/is_logged_in.dart';
import 'package:ecommerce_app/domain/auth/usecase/signin.dart';
import 'package:ecommerce_app/domain/auth/usecase/signup.dart';
import 'package:ecommerce_app/domain/category/repository/category.dart';
import 'package:ecommerce_app/domain/category/usecases/get_categories.dart';
import 'package:ecommerce_app/domain/order/repositories/order.dart';
import 'package:ecommerce_app/domain/order/usecases/add_to_cart.dart';
import 'package:ecommerce_app/domain/order/usecases/get_cart_products.dart';
import 'package:ecommerce_app/domain/order/usecases/get_orders.dart';
import 'package:ecommerce_app/domain/order/usecases/order_registration.dart';
import 'package:ecommerce_app/domain/order/usecases/remove_cart_product.dart';
import 'package:ecommerce_app/domain/product/repositories/product_repository.dart';
import 'package:ecommerce_app/domain/product/usecases/add_or_remove_favourite_product.dart';
import 'package:ecommerce_app/domain/product/usecases/get_favourite_products.dart';
import 'package:ecommerce_app/domain/product/usecases/get_new_in.dart';
import 'package:ecommerce_app/domain/product/usecases/get_products_by_categoryid.dart';
import 'package:ecommerce_app/domain/product/usecases/get_products_by_title.dart';
import 'package:ecommerce_app/domain/product/usecases/get_top_selling.dart';
import 'package:ecommerce_app/domain/product/usecases/is_favourite.dart';
import 'package:get_it/get_it.dart';

import 'domain/auth/usecase/password_reset_email.dart';

final sl = GetIt.instance;

void setUpServiceLocator() {
  //services:
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl()); //auth
  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl()); //categories
  sl.registerSingleton<ProductFirebaseService>(ProductFirebaseServiceImpl());
  sl.registerSingleton<OrderFirebaseService>(OrderFirebaseServiceImpl());

  //repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepoImpl());
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl());
  sl.registerSingleton<OrderRepository>(OrderRepositoryImpl());

  //usecase:
  //auth
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<PasswordResetEmailUseCase>(PasswordResetEmailUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());

  //categories
  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());

  //products
  sl.registerSingleton<GetTopSellingUseCase>(GetTopSellingUseCase());
  sl.registerSingleton<GetNewInUseCase>(GetNewInUseCase());
  
  sl.registerSingleton<GetProductsByCategoryIdUseCase>(GetProductsByCategoryIdUseCase()); 
  sl.registerSingleton<GetProductsByTitleUseCase>(GetProductsByTitleUseCase()); 

  //orders
  sl.registerSingleton<AddToCartUseCase>(AddToCartUseCase()); 
  sl.registerSingleton<GetCartProductsUseCase>(GetCartProductsUseCase());
  sl.registerSingleton<RemoveCartProductsUseCase>(RemoveCartProductsUseCase());
  sl.registerSingleton<OrderRegistrationUseCase>(OrderRegistrationUseCase());

  //favourities
  sl.registerSingleton<AddOrRemoveFavouriteProductUseCase>(AddOrRemoveFavouriteProductUseCase());
  sl.registerSingleton<IsFavouriteUseCase>(IsFavouriteUseCase());
  sl.registerSingleton<GetFavouriteProductsUseCase>(GetFavouriteProductsUseCase());

  sl.registerSingleton<GetOrdersUseCase>(GetOrdersUseCase());
  
}

