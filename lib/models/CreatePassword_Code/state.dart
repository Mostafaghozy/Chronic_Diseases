abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {}

class ResetPasswordFailure extends ResetPasswordState {
  final String error;

  ResetPasswordFailure(this.error);
}

class ResetPasswordValidation extends ResetPasswordState {
  final bool isPasswordValid;
  final bool doPasswordsMatch;

  ResetPasswordValidation({
    required this.isPasswordValid,
    required this.doPasswordsMatch,
  });
}
