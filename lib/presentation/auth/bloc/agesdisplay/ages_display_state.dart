import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AgesDisplayState {}
class AgesDisplayLoading extends AgesDisplayState {}

class AgesDisplayLoaded extends AgesDisplayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;
  AgesDisplayLoaded({required this.ages});
}

class AgesDisplayLoadFailure extends AgesDisplayState {
  final String message;

  AgesDisplayLoadFailure({required this.message});
}
