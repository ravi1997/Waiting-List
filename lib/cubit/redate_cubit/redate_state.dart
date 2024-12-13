part of 'redate_cubit.dart';

@immutable
sealed class RedateState {}

final class RedateInitial extends RedateState {}

final class RedateLoading extends RedateState {}

final class RedateLoaded extends RedateState {}

final class RedateError extends RedateState {
  final String error;
  RedateError({required this.error});
}
