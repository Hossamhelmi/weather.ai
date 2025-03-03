part of 'predection_cubit.dart';

sealed class PredectionState {}

final class PredectionInitial extends PredectionState {}
final class PredectioLoading extends PredectionState {}
final class PredectionLoaded extends PredectionState {
  final String predectedMessage;
  PredectionLoaded(this.predectedMessage);
}
final class PredectioError extends PredectionState {
  final String message;
  PredectioError(this.message);
}
