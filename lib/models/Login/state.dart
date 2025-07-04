abstract class LoginState {}

class IntialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMessage;

  LoginErrorState({this.errorMessage = 'Login failed. Please try again.'});
}
