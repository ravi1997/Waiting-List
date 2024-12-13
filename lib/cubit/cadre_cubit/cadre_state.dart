part of 'cadre_cubit.dart';

@immutable
sealed class CadreState {}

final class CadreInitial extends CadreState {}

final class CadreLoading extends CadreState {}

final class CadreLoaded extends CadreState {
  final List<CadreModal> cadreModal;
  CadreLoaded({required this.cadreModal});
}

final class CadreError extends CadreState {
  final String error;
  CadreError({required this.error});
}
