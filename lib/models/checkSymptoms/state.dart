import 'prediction_response_model.dart';

abstract class CheckSymptomsState {
  bool get isLoading => false;
}

class CheckSymptomsInitial extends CheckSymptomsState {}

class CheckSymptomsLoading extends CheckSymptomsState {
  @override
  bool get isLoading => true;
}

class CheckSymptomsSuccess extends CheckSymptomsState {
  final PredictionResponseModel result;
  CheckSymptomsSuccess(this.result);
}

class CheckSymptomsError extends CheckSymptomsState {
  final String message;
  CheckSymptomsError(this.message);
}
