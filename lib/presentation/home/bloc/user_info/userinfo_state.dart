part of 'userinfo_cubit.dart';

@immutable
sealed class UserinfoDisplayState {}

final class UserinfoDisplayInitial extends UserinfoDisplayState {}

final class UserinfoLoaded extends UserinfoDisplayState {
  final UserEntity user;
  UserinfoLoaded({required this.user});
}

final class UserinfoFailure extends UserinfoDisplayState {}

final class UserinfoLoading extends UserinfoDisplayState {}

