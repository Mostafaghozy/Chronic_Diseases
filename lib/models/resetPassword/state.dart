abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final String email;
  ForgetPasswordSuccess(this.email);
}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String error;
  ForgetPasswordFailure(this.error);
}

class EmailValidationState extends ForgetPasswordState {
  final bool isValid;
  EmailValidationState(this.isValid);
}
