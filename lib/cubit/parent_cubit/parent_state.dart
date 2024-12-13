part of 'parent_cubit.dart';

@immutable
sealed class ParentState {}

final class ParentInitial extends ParentState {}

final class ParentLoading extends ParentState {}

final class ParentLoaded extends ParentState {
  ParentLoaded();
}

final class ParentError extends ParentState {
  final String error;
  ParentError({required this.error});
}
