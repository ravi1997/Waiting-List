part of 'child_cubit.dart';

@immutable
sealed class ChildState {}

final class ChildInitial extends ChildState {}

final class ChildLoading extends ChildState {}

final class ChildLoaded extends ChildState {
  final int query;
  final List<User> userModal;
  ChildLoaded({required this.query, required this.userModal});
}

final class ChildError extends ChildState {
  final String error;
  ChildError({required this.error});
}
