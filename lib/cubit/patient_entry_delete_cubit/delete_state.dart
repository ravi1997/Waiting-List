part of 'delete_cubit.dart';

@immutable
sealed class DeleteState {}

final class DeleteInitial extends DeleteState {}

final class DeleteLoading extends DeleteState {}

final class DeleteLoaded extends DeleteState {}

final class DeleteError extends DeleteState {
  final String error;
  DeleteError({required this.error});
}
