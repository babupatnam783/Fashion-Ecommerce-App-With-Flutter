import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryFirebaseService {
  Future<Either> getCategories();
}

class CategoryFirebaseServiceImpl extends CategoryFirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  @override
  Future<Either> getCategories() async {
    try {
      var categories = await _db.collection('Categories').get();
      return Right(categories.docs.map((e) => e.data(),).toList());
    } catch (e) {
      return const Left("Please try again");
    }
  }
}
