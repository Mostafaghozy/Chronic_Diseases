import 'package:chronic_diseases/models/Login/state.dart';
import 'package:dio/dio.dart';
import 'package:chronic_diseases/core/user_session.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final Dio _dio = Dio();
  final String _loginUrl = 'http://authapifirst.runasp.net/api/Account/login';

  LoginCubit() : super(IntialLoginState()) {
    // إعداد الـ dio options
    _dio.options.connectTimeout = Duration(seconds: 30);
    _dio.options.receiveTimeout = Duration(seconds: 30);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  Future<void> login(String email, String password) async {
    emit(LoadingLoginState());

    try {
      final response = await _dio.post(
        _loginUrl,
        data: {"email": email, "password": password},
      );

      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        // استخراج اسم المستخدم من الاستجابة إذا كان متاحًا
        String? username;
        if (response.data is Map && response.data.containsKey('username')) {
          username = response.data['username'];
        } else if (response.data is Map &&
            response.data.containsKey('userName')) {
          username = response.data['userName'];
        }
        if (username != null) {
          // حفظ اسم المستخدم في التخزين المحلي
          // ignore: use_build_context_synchronously
          await Future.delayed(Duration.zero); // لضمان عدم وجود مشاكل تزامن
          // استيراد UserSession في الأعلى
          // import 'package:chronic_diseases/core/user_session.dart';
          await UserSession.saveUsername(username);
        }
        emit(LoginSuccessState());
      } else {
        emit(
          LoginErrorState(
            errorMessage: 'Login failed. Status: ${response.statusCode}',
          ),
        );
      }
    } on DioException catch (dioError) {
      String errorMessage = 'Login failed. Please try again.';

      if (dioError.type == DioExceptionType.connectionTimeout ||
          dioError.type == DioExceptionType.receiveTimeout) {
        errorMessage =
            'Connection timeout. Please check your internet connection.';
      } else if (dioError.type == DioExceptionType.connectionError) {
        errorMessage = 'No internet connection. Please check your network.';
      } else if (dioError.response != null) {
        final statusCode = dioError.response!.statusCode;
        if (statusCode == 401) {
          errorMessage = 'Invalid email or password.';
        } else if (statusCode == 400) {
          errorMessage = 'Invalid request. Please check your input.';
        } else if (statusCode == 500) {
          errorMessage = 'Server error. Please try again later.';
        } else {
          errorMessage = 'Login failed. Error: $statusCode';
        }
      }

      print('Dio error: ${dioError.message}');
      emit(LoginErrorState(errorMessage: errorMessage));
    } catch (e) {
      print('General error: $e');
      emit(LoginErrorState(errorMessage: 'An unexpected error occurred.'));
    }
  }

  // دالة لحفظ الـ token (يمكنك استخدام shared_preferences)
  // Future<void> _saveToken(String token) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('auth_token', token);
  // }
}
