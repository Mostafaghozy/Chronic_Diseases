abstract class CheckSymptomsState {}

class CheckSymptomsInitial extends CheckSymptomsState {}

class CheckSymptomsLoading extends CheckSymptomsState {}

class CheckSymptomsSuccess extends CheckSymptomsState {
  final dynamic result; // Update with a model if available
  CheckSymptomsSuccess(this.result);
}

class CheckSymptomsError extends CheckSymptomsState {
  final String message;
  CheckSymptomsError(this.message);
}
