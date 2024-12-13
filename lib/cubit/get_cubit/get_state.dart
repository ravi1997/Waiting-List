part of 'get_cubit.dart';

@immutable
sealed class GetState {}

final class GetInitial extends GetState {}

final class GetLoading extends GetState {}

final class GetLoaded extends GetState {
  final Advice adviceModal;

  GetLoaded({required this.adviceModal});
}

final class GetError extends GetState {
  final String error;
  GetError({required this.error});
}
