import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:chronic_diseases/models/ChangePassword/state.dart';
import 'package:http/http.dart' as http;

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  String? newPassword;
  String? confirmPassword;
  bool isPasswordValid = false;
  bool doPasswordsMatch = false;

  void validatePassword(String password) {
    newPassword = password;
    isPasswordValid = password.length >= 8;
    _checkPasswordsMatch();
  }

  void validateConfirmPassword(String password) {
    confirmPassword = password;
    _checkPasswordsMatch();
  }

  void _checkPasswordsMatch() {
    doPasswordsMatch = newPassword == confirmPassword &&
        confirmPassword != null &&
        confirmPassword!.isNotEmpty;

    emit(PasswordValidationState(
      isPasswordValid: isPasswordValid,
      doPasswordsMatch: doPasswordsMatch,
    ));
  }

  Future<void> changePassword({
    required String email,
    String? verificationCode,
  }) async {
    if (!isPasswordValid || !doPasswordsMatch || newPassword == null) {
      emit(ChangePasswordErrorState('Please enter valid matching passwords'));
      return;
    }

    emit(LoadingChangePasswordState());

    try {
      final response = await http.post(
        Uri.parse('http://authapifirst.runasp.net/api/Auth/reset-password'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'code': verificationCode,
          'newPassword': newPassword,
        }),
      );

      if (response.statusCode == 200) {
        emit(ChangePasswordSuccessState());
      } else {
        final error =
            jsonDecode(response.body)['message'] ?? 'Failed to reset password';
        emit(ChangePasswordErrorState(error));
      }
    } catch (e) {
      log('Error resetting password: $e');
      emit(ChangePasswordErrorState('Connection error. Please try again.'));
    }
  }
}
