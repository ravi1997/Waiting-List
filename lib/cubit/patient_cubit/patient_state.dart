part of 'patient_cubit.dart';

@immutable
sealed class PatientState {}

final class PatientInitial extends PatientState {}

final class PatientLoading extends PatientState {}

final class PatientLoaded extends PatientState {
  final PatientDemographic patientModal;
  PatientLoaded({required this.patientModal});
}

final class PatientError extends PatientState {
  final String error;
  PatientError({required this.error});
}
