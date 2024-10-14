part of 'building_cubit.dart';

@immutable
sealed class BuildingState {}

final class BuildingInitial extends BuildingState {}
final class BuildingLoading extends BuildingState {}
final class BuildingLoaded extends BuildingState {
  final List<BuildingModal> buildingModal;
  BuildingLoaded({required this.buildingModal});
}
final class BuildingError extends BuildingState {
  final String error;
  BuildingError({required this.error});
}
