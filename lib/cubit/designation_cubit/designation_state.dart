part of 'designation_cubit.dart';

@immutable
sealed class DesignationState {}

final class DesignationInitial extends DesignationState {}

final class DesignationLoading extends DesignationState {}

final class DesignationLoaded extends DesignationState {
  final List<DesignationModal> designationModal;
  DesignationLoaded({required this.designationModal});
}

final class DesignationError extends DesignationState {
  final String error;
  DesignationError({required this.error});
}
