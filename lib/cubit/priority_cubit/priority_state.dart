part of 'priority_cubit.dart';

@immutable
sealed class PriorityState {}

final class PriorityInitial extends PriorityState {}

final class PriorityLoading extends PriorityState {}

final class PriorityLoaded extends PriorityState {
  final List<Priority> priorityModal;
  PriorityLoaded({required this.priorityModal});
}

final class PriorityError extends PriorityState {
  final String error;
  PriorityError({required this.error});
}
