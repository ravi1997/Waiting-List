part of 'department_cubit.dart';

@immutable
sealed class DepartmentState {}

final class DepartmentInitial extends DepartmentState {}

final class DepartmentLoading extends DepartmentState {}

final class DepartmentLoaded extends DepartmentState {
  final List<DepartmentModal> departmentModal;
  DepartmentLoaded({required this.departmentModal});
}

final class DepartmentError extends DepartmentState {
  final String error;
  DepartmentError({required this.error});
}
