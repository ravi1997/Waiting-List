part of 'room_cubit.dart';

@immutable
sealed class RoomState {}

final class RoomInitial extends RoomState {}

final class RoomLoading extends RoomState {}

final class RoomLoaded extends RoomState {
  final List<RoomModal> roomModal;
  RoomLoaded({required this.roomModal});
}

final class RoomError extends RoomState {
  final String error;
  RoomError({required this.error});
}
