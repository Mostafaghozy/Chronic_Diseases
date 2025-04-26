abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class LoadingChangePasswordState extends ChangePasswordState {}

class ChangePasswordSuccessState extends ChangePasswordState {}

class ChangePasswordErrorState extends ChangePasswordState {
  final String error;

  ChangePasswordErrorState(this.error);
}

class PasswordValidationState extends ChangePasswordState {
  final bool isPasswordValid;
  final bool doPasswordsMatch;

  PasswordValidationState({
    required this.isPasswordValid,
    required this.doPasswordsMatch,
  });
}
