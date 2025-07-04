abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final String message;

  ForgetPasswordSuccess(this.message);
}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String error;

  ForgetPasswordFailure(this.error);
}

class ForgetPasswordEmailValid extends ForgetPasswordState {
  final bool isValid;

  ForgetPasswordEmailValid(this.isValid);
}
