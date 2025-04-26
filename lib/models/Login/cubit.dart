import 'package:chronic_diseases/models/Login/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final Dio _dio = Dio();
  final String _loginUrl = 'http://authapifirst.runasp.net/api/Account/login';

  LoginCubit() : super(IntialLoginState());

  Future<void> login(String email, String password) async {
    emit(LoadingLoginState());
    try {
      final response = await _dio.post(
        _loginUrl,
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        emit(LoginSuccessState());
      } else {
        emit(LoginErrorState());
      }
    } catch (e) {
      emit(LoginErrorState());
    }
  }
}
