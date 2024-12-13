part of 'short_cubit.dart';

@immutable
sealed class ShortState {}

final class ShortInitial extends ShortState {}

final class ShortLoading extends ShortState {}

final class ShortLoaded extends ShortState {
  final List<Short> shortModal;
  ShortLoaded({required this.shortModal});
}

final class ShortError extends ShortState {
  final String error;
  ShortError({required this.error});
}
