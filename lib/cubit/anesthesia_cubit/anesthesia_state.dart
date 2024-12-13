part of 'anesthesia_cubit.dart';

@immutable
sealed class AnesthesiaState {}

final class AnesthesiaInitial extends AnesthesiaState {}

final class AnesthesiaLoading extends AnesthesiaState {}

final class AnesthesiaLoaded extends AnesthesiaState {
  final List<Anesthesia> anesthesiaModal;
  AnesthesiaLoaded({required this.anesthesiaModal});
}

final class AnesthesiaError extends AnesthesiaState {
  final String error;
  AnesthesiaError({required this.error});
}
