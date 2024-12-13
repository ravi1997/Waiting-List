part of 'diagnosis_cubit.dart';

@immutable
sealed class DiagnosisState {}

final class DiagnosisInitial extends DiagnosisState {}

final class DiagnosisLoading extends DiagnosisState {}

final class DiagnosisLoaded extends DiagnosisState {
  final List<Diagnosis> diagnosisModal;
  DiagnosisLoaded({required this.diagnosisModal});
}

final class DiagnosisError extends DiagnosisState {
  final String error;
  DiagnosisError({required this.error});
}
