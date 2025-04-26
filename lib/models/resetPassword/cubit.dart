import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:chronic_diseases/models/resetPassword/state.dart';
import 'package:http/http.dart' as http;

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  String? email;
  bool isEmailValid = false;

  void validateEmail(String email) {
    this.email = email;
    isEmailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
    emit(EmailValidationState(isEmailValid));
  }

  Future<void> sendResetCode() async {
    emit(ForgetPasswordLoading());
    try {
      final response = await http.post(
        Uri.parse('http://authapifirst.runasp.net/api/Auth/forget-password'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      final responseBody = response.body;

      // تحسين معالجة الرد
      if (response.statusCode == 200) {
        try {
          // ignore: unused_local_variable
          final jsonResponse = jsonDecode(responseBody);
          emit(ForgetPasswordSuccess(email!));
        } catch (e) {
          // إذا كان الرد غير JSON ولكن نصوص عادية
          if (responseBody.contains("User not found")) {
            emit(ForgetPasswordFailure('User not found'));
          } else {
            emit(ForgetPasswordFailure('Invalid response format'));
          }
        }
      } else {
        // معالجة الأخطاء المختلفة
        if (responseBody.contains("User not found")) {
          emit(ForgetPasswordFailure('User not found'));
        } else if (response.statusCode >= 500) {
          emit(ForgetPasswordFailure('Server error, please try later'));
        } else {
          emit(ForgetPasswordFailure(
              'Failed to send code: ${response.statusCode}'));
        }
      }
    } catch (e) {
      log('Error sending reset code: $e');
      // تمييز أخطاء الشبكة عن أخطاء الخادم
      if (e is SocketException || e is TimeoutException) {
        emit(ForgetPasswordFailure(
            'Network error, please check your connection'));
      } else {
        emit(ForgetPasswordFailure('An error occurred, please try again'));
      }
    }
  }
}
