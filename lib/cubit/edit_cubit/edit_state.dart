part of 'edit_cubit.dart';

@immutable
sealed class EditState {}

final class EditInitial extends EditState {}

final class EditLoading extends EditState {}

final class EditLoaded extends EditState {
  final BuildContext context;

  EditLoaded({required this.context});
}

final class EditError extends EditState {
  final String error;
  EditError({required this.error});
}
