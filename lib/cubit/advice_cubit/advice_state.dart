part of 'advice_cubit.dart';

@immutable
sealed class AdviceState {}

final class AdviceInitial extends AdviceState {}

final class AdviceLoading extends AdviceState {}

final class AdviceLoaded extends AdviceState {}

final class AdviceError extends AdviceState {
  final String error;
  AdviceError({required this.error});
}
