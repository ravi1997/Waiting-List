part of 'eua_cubit.dart';

@immutable
sealed class EUAState {}

final class EUAInitial extends EUAState {}

final class EUALoading extends EUAState {}

final class EUALoaded extends EUAState {
  final List<EUA> euaModal;
  EUALoaded({required this.euaModal});
}

final class EUAError extends EUAState {
  final String error;
  EUAError({required this.error});
}
