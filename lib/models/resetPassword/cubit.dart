import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  // Email validation
  void validateEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    final isValid = emailRegex.hasMatch(email) && email.isNotEmpty;
    emit(ForgetPasswordEmailValid(isValid));
  }

  // Send forget password request
  Future<void> sendForgetPasswordRequest(String email) async {
    emit(ForgetPasswordLoading());

    try {
      // Validate email before sending request
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );
      if (!emailRegex.hasMatch(email) || email.isEmpty) {
        emit(ForgetPasswordFailure('Please enter a valid email address'));
        return;
      }

      final response = await http.post(
        Uri.parse('http://authapifirst.runasp.net/api/Auth/forget-password'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email}),
      );

      if (response.statusCode == 200) {
        // Success response
        final responseBody = response.body;
        // The API returns plain text, not JSON
        final message = responseBody.isNotEmpty
            ? responseBody
            : 'Verification code has been sent to your email.';
        emit(ForgetPasswordSuccess(message));
      } else if (response.statusCode == 400) {
        // Bad request - try to parse JSON error, fallback to plain text
        try {
          final responseData = json.decode(response.body);
          final errorMessage = responseData['message'] ?? response.body;
          emit(ForgetPasswordFailure(errorMessage));
        } catch (e) {
          // If not JSON, use plain text
          emit(
            ForgetPasswordFailure(
              response.body.isNotEmpty
                  ? response.body
                  : 'Invalid email address',
            ),
          );
        }
      } else if (response.statusCode == 404) {
        // Email not found - try to parse response
        try {
          final responseData = json.decode(response.body);
          final errorMessage =
              responseData['message'] ?? 'Email address not found';
          emit(ForgetPasswordFailure(errorMessage));
        } catch (e) {
          emit(
            ForgetPasswordFailure(
              response.body.isNotEmpty
                  ? response.body
                  : 'Email address not found',
            ),
          );
        }
      } else {
        // Other errors
        emit(ForgetPasswordFailure('Something went wrong. Please try again.'));
      }
    } catch (e) {
      // Network or other errors
      emit(
        ForgetPasswordFailure(
          'Network error. Please check your connection and try again.',
        ),
      );
    }
  }
}
