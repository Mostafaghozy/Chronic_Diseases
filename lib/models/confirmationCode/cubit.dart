import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:chronic_diseases/models/confirmationCode/state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  String? code;
  String? email;

  Future<void> sendVerificationCode(String email) async {
    this.email = email;
    emit(ResetPasswordLoading());
    try {
      final response = await http.post(
        Uri.parse('http://authapifirst.runasp.net/api/Auth/send-code'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200) {
        emit(CodeSentSuccess(email));
      } else {
        final error = jsonDecode(response.body)['message'] ??
            'Failed to send verification code';
        emit(ResetPasswordFailure(error));
      }
    } catch (e) {
      log('Error sending verification code: $e');
      emit(ResetPasswordFailure('Connection error. Please try again.'));
    }
  }

  void updateCodeAtIndex(int index, String value) {
    final chars = code?.split('') ?? List.filled(4, '');
    if (index < chars.length) {
      chars[index] = value;
    } else {
      chars.add(value);
    }
    code = chars.join();
    emit(CodeUpdatedState(code!));
  }

  void validateCode(String code) {
    this.code = code;
    emit(CodeValidationChanged(code.length == 4));
  }

  Future<void> verifyCode(String code) async {
    if (code.length != 4) {
      emit(ResetPasswordFailure('Please enter complete 4-digit code'));
      return;
    }

    emit(ResetPasswordLoading());
    try {
      final response = await http.post(
        Uri.parse('http://authapifirst.runasp.net/api/Auth/verify-code'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'code': code,
        }),
      );

      if (response.statusCode == 200) {
        emit(CodeVerificationSuccess());
      } else {
        final error =
            jsonDecode(response.body)['message'] ?? 'Invalid verification code';
        emit(ResetPasswordFailure(error));
      }
    } catch (e) {
      log('Error verifying code: $e');
      emit(ResetPasswordFailure('Connection error. Please try again.'));
    }
  }

  Future<void> resetPassword({String? newPassword}) async {
    if (code == null || code!.length != 4) {
      emit(ResetPasswordFailure('Please enter valid verification code'));
      return;
    }

    emit(ResetPasswordLoading());
    try {
      final response = await http.post(
        Uri.parse('http://authapifirst.runasp.net/api/Auth/reset-password'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'code': code,
          'newPassword': newPassword,
        }),
      );

      if (response.statusCode == 200) {
        emit(ResetPasswordSuccess());
      } else {
        final error =
            jsonDecode(response.body)['message'] ?? 'Failed to reset password';
        emit(ResetPasswordFailure(error));
      }
    } catch (e) {
      log('Error resetting password: $e');
      emit(ResetPasswordFailure('Connection error. Please try again.'));
    }
  }
}
