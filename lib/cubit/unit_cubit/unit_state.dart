part of 'unit_cubit.dart';

@immutable
sealed class UnitState {}

final class UnitInitial extends UnitState {}

final class UnitLoading extends UnitState {}

final class UnitLoaded extends UnitState {
  final List<UnitModal> unitModal;
  UnitLoaded({required this.unitModal});
}

final class UnitError extends UnitState {
  final String error;
  UnitError({required this.error});
}
