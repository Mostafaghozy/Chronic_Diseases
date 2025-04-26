abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {}

class ResetPasswordFailure extends ResetPasswordState {
  final String error;

  ResetPasswordFailure(this.error);
}

class CodeSentSuccess extends ResetPasswordState {
  final String email;

  CodeSentSuccess(this.email);
}

class CodeUpdatedState extends ResetPasswordState {
  final String code;

  CodeUpdatedState(this.code);
}

class CodeValidationChanged extends ResetPasswordState {
  final bool isValid;

  CodeValidationChanged(this.isValid);
}

class CodeVerificationSuccess extends ResetPasswordState {}
