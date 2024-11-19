import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/auth/models/signin_user_req.dart';
import 'package:ecommerce_app/data/auth/models/user_creation_req.dart';

abstract class AuthRepository {
  Future<Either> signIn(SigninUserReq user);
  Future<Either> signUp(UserCreationReq user);
  Future<Either> getAges();
  Future<Either> sendPasswordResetEmailPage(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}
