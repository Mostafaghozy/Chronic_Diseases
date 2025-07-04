// ignore_for_file: file_names

abstract class PatientRegistrationState {}

class PatientRegistrationInitial extends PatientRegistrationState {}

class PatientRegistrationLoading extends PatientRegistrationState {}

class PatientRegistrationSuccess extends PatientRegistrationState {
  final String message;

  PatientRegistrationSuccess(this.message);
}

class PatientRegistrationError extends PatientRegistrationState {
  final String error;

  PatientRegistrationError(this.error);
}

// Validation states
class PatientRegistrationValidationError extends PatientRegistrationState {
  final Map<String, String> errors;

  PatientRegistrationValidationError(this.errors);
}
