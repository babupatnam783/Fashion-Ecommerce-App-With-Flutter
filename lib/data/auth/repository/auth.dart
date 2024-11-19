import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/auth/models/signin_user_req.dart';
import 'package:ecommerce_app/data/auth/models/user.dart';
import 'package:ecommerce_app/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_app/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce_app/domain/auth/repository/auth.dart';
import 'package:ecommerce_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SigninUserReq user) async {
    return await sl<AuthFirebaseService>().signIn(user);
  }

  @override
  Future<Either> signUp(UserCreationReq user) async {
    return await sl<AuthFirebaseService>().signUp(user);
  }

  @override
  Future<Either> getAges() async {
    return await sl<AuthFirebaseService>().getAges();
  }
  
  @override
  Future<Either> sendPasswordResetEmailPage(String email) async {
    return await sl<AuthFirebaseService>().sendPasswordResetEmailPage(email);
  }
  
  @override
  Future<bool> isLoggedIn() async{
    return await sl<AuthFirebaseService>().isLoggedIn();
  }
  
  @override
  Future<Either> getUser() async {
    var returnedData = await sl<AuthFirebaseService>().getUser();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(UserModel.fromMap(data).toEntity());
    });
  }
}
