part of 'eye_cubit.dart';

@immutable
sealed class EyeState {}

final class EyeInitial extends EyeState {}

final class EyeLoading extends EyeState {}

final class EyeLoaded extends EyeState {
  final List<Eye> eyeModal;
  EyeLoaded({required this.eyeModal});
}

final class EyeError extends EyeState {
  final String error;
  EyeError({required this.error});
}
