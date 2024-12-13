part of 'slot_cubit.dart';

@immutable
sealed class SlotState {}

final class SlotInitial extends SlotState {}

final class SlotLoading extends SlotState {}

final class SlotLoaded extends SlotState {
  final List<PatientEntry> patientEntryModal;
  SlotLoaded({required this.patientEntryModal});
}

final class SlotError extends SlotState {
  final String error;
  SlotError({required this.error});
}
