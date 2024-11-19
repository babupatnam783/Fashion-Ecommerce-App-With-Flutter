import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/auth/models/signin_user_req.dart';
import 'package:ecommerce_app/data/auth/models/user_creation_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signIn(SigninUserReq user);
  Future<Either> signUp(UserCreationReq user);
  Future<Either> getAges();
  Future<Either> sendPasswordResetEmailPage(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<Either> signUp(UserCreationReq user) async {
    try {
      var returnedData = await _auth.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);
      await _db.collection('users').doc(returnedData.user!.uid).set({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'gender': user.gender,
        'age': user.age,
        'image': returnedData.user!.photoURL,
        'userId': returnedData.user!.uid
      });

      return const Right('Sign up was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData = await _db.collection('Ages').get();
      return Right(returnedData.docs);
    } on FirebaseException catch (_) {
      return const Left("Please try again");
    }
  }

  @override
  Future<Either> signIn(SigninUserReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email!, password: user.password!);
      return const Right("Sign In was successfull");
    } on FirebaseAuthException catch (e) {
      String message = '';
       if(e.code == 'invalid-email') {
        message = 'Not user found for this email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for this user';
      }
      return Left(message);
    }
  }
  
  @override
  Future<Either> sendPasswordResetEmailPage(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return const Right("Password reset email is sent");
    } catch (e) {
      return const Left("Please try again");
    }
  }
  
  @override
  Future<bool> isLoggedIn() async {
    if (_auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      var user = _auth.currentUser!;
      var userData = await _db.collection('users').doc(user.uid).get();
      return Right(userData.data());
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
