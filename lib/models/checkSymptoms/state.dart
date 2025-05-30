import 'prediction_request_model.dart';

abstract class CheckSymptomsState {}

class CheckSymptomsInitial extends CheckSymptomsState {}

class CheckSymptomsLoading extends CheckSymptomsState {}

class CheckSymptomsSuccess extends CheckSymptomsState {
  final dynamic result; // Update with a model if available
  final PredictionRequestModel inputData;
  CheckSymptomsSuccess(this.result, this.inputData);
}

class CheckSymptomsError extends CheckSymptomsState {
  final String message;
  CheckSymptomsError(this.message);
}
