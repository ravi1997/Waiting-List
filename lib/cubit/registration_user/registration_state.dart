part of 'registration_cubit.dart';

@immutable
sealed class RegistrationUserState {}

final class RegistrationUserInitial extends RegistrationUserState {}

final class RegistrationUserLoading extends RegistrationUserState {}

final class RegistrationUserLoaded extends RegistrationUserState {
  final RegistrationUserModal userModal;
  RegistrationUserLoaded({required this.userModal});
}

final class RegistrationUserError extends RegistrationUserState {
  final String error;
  RegistrationUserError({required this.error});
}
