part of 'doctor_cubit.dart';

@immutable
sealed class DoctorState {}

final class DoctorInitial extends DoctorState {}

final class DoctorLoading extends DoctorState {}

final class DoctorLoaded extends DoctorState {
  final List<User> doctorModal;
  DoctorLoaded({required this.doctorModal});
}

final class DoctorError extends DoctorState {
  final String error;
  DoctorError({required this.error});
}
