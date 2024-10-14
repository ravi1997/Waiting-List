part of 'floor_cubit.dart';

@immutable
sealed class FloorState {}

final class FloorInitial extends FloorState {}

final class FloorLoading extends FloorState {}

final class FloorLoaded extends FloorState {
  final List<FloorModal> floorModal;
  FloorLoaded({required this.floorModal});
}

final class FloorError extends FloorState {
  final String error;
  FloorError({required this.error});
}
