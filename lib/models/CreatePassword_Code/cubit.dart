import 'package:chronic_diseases/models/CreatePassword_Code/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  String? _email;
  String? _verificationCode;
  String? _newPassword;
  String? _confirmPassword;
  bool _isPasswordValid = false;
  bool _doPasswordsMatch = false;

  void setEmail(String email) {
    _email = email;
  }

  void setVerificationCode(String code) {
    _verificationCode = code;
    print('Verification code set: ' + (_verificationCode ?? 'NULL'));
  }

  void validatePassword(String password) {
    _newPassword = password;
    _isPasswordValid = _isValidPassword(password);
    _checkPasswordMatch();

    emit(
      ResetPasswordValidation(
        isPasswordValid: _isPasswordValid,
        doPasswordsMatch: _doPasswordsMatch,
      ),
    );
  }

  void validateConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    _checkPasswordMatch();

    emit(
      ResetPasswordValidation(
        isPasswordValid: _isPasswordValid,
        doPasswordsMatch: _doPasswordsMatch,
      ),
    );
  }

  void _checkPasswordMatch() {
    _doPasswordsMatch =
        _newPassword != null &&
        _confirmPassword != null &&
        _newPassword == _confirmPassword;
  }

  bool _isValidPassword(String password) {
    // Password must be at least 8 characters
    return password.length >= 8;
  }

  Future<void> resetPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    print('Reset password called!');
    print('Email: >' + email + '<');
    print('Code: >' + code + '<');
    print('New Password: >' + newPassword + '<');
    if (!_isValidPassword(newPassword)) {
      emit(ResetPasswordFailure('Password must be at least 8 characters'));
      return;
    }

    if (newPassword != _confirmPassword) {
      emit(ResetPasswordFailure('Passwords do not match'));
      return;
    }

    emit(ResetPasswordLoading());

    try {
      final response = await http.post(
        Uri.parse('http://authapifirst.runasp.net/api/Auth/reset-password'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'code': code,
          'newPassword': newPassword,
        }),
      );
      print('Status code: ' + response.statusCode.toString());
      print('Response body: ' + response.body);

      if (response.statusCode == 200) {
        emit(ResetPasswordSuccess());
      } else {
        try {
          final errorData = json.decode(response.body);
          emit(
            ResetPasswordFailure(
              errorData['message'] ?? 'Failed to reset password',
            ),
          );
        } catch (e) {
          emit(ResetPasswordFailure('Failed to reset password'));
        }
      }
    } catch (e) {
      emit(ResetPasswordFailure('Network error: ${e.toString()}'));
    }
  }

  // Alternative method using stored values
  Future<void> resetPasswordWithStoredValues() async {
    if (_email == null || _verificationCode == null || _newPassword == null) {
      emit(ResetPasswordFailure('Missing required information'));
      return;
    }

    await resetPassword(
      email: _email!,
      code: _verificationCode!,
      newPassword: _newPassword!,
    );
  }

  bool get isPasswordValid => _isPasswordValid;
  bool get doPasswordsMatch => _doPasswordsMatch;
  bool get canSubmit => _isPasswordValid && _doPasswordsMatch;
}
