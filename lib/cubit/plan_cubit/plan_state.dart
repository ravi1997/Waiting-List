part of 'plan_cubit.dart';

@immutable
sealed class PlanState {}

final class PlanInitial extends PlanState {}

final class PlanLoading extends PlanState {}

final class PlanLoaded extends PlanState {
  final List<Plan> planModal;
  PlanLoaded({required this.planModal});
}

final class PlanError extends PlanState {
  final String error;
  PlanError({required this.error});
}
