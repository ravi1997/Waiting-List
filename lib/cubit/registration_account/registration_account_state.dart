part of 'registration_account_cubit.dart';

@immutable
sealed class RegistrationAccountState {}

final class RegistrationAccountInitial extends RegistrationAccountState {}

final class RegistrationAccountLoading extends RegistrationAccountState {}

final class RegistrationAccountLoaded extends RegistrationAccountState {}

final class RegistrationAccountError extends RegistrationAccountState {
  final String error;
  RegistrationAccountError({required this.error});
}
