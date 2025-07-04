// patient_registration_cubit.dart
import 'package:chronic_diseases/models/SignUp/patient/statePatient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class PatientRegistrationCubit extends Cubit<PatientRegistrationState> {
  PatientRegistrationCubit() : super(PatientRegistrationInitial());

  final Dio _dio = Dio();
  static const String _baseUrl =
      "http://authapifirst.runasp.net/api/Account/register/patient";

  Future<void> registerPatient({
    required String username,
    required String emailAddress,
    required String password,
    required String confirmPassword,
    required bool termsAccepted,
  }) async {
    // Validate input
    final validationErrors = _validateInput(
      username: username,
      emailAddress: emailAddress,
      password: password,
      confirmPassword: confirmPassword,
      termsAccepted: termsAccepted,
    );

    if (validationErrors.isNotEmpty) {
      emit(PatientRegistrationValidationError(validationErrors));
      return;
    }

    emit(PatientRegistrationLoading());

    try {
      final requestBody = {
        "username": username,
        "emailAddress": emailAddress,
        "password": password,
        "confirmPassword": confirmPassword,
        "termsAccepted": termsAccepted,
      };

      final response = await _dio.post(
        _baseUrl,
        data: requestBody,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Registration successful!");
        emit(PatientRegistrationSuccess("Registration successful!"));
      } else {
        emit(
          PatientRegistrationError("Registration failed. Please try again."),
        );
      }
    } on DioException catch (e) {
      String errorMessage = "Registration failed. Please try again.";

      if (e.response != null) {
        switch (e.response!.statusCode) {
          case 400:
            errorMessage =
                "Invalid data provided. Please check your information.";
            break;
          case 409:
            errorMessage = "Username or email already exists.";
            break;
          case 500:
            errorMessage = "Server error. Please try again later.";
            break;
          default:
            errorMessage = e.response?.data?['message'] ?? errorMessage;
        }
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        errorMessage =
            "Connection timeout. Please check your internet connection.";
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage = "No internet connection. Please check your network.";
      }

      emit(PatientRegistrationError(errorMessage));
    } catch (e) {
      emit(PatientRegistrationError("An unexpected error occurred."));
    }
  }

  Map<String, String> _validateInput({
    required String username,
    required String emailAddress,
    required String password,
    required String confirmPassword,
    required bool termsAccepted,
  }) {
    Map<String, String> errors = {};

    // Username validation
    if (username.trim().isEmpty) {
      errors['username'] = 'Username is required';
    } else if (username.length < 3) {
      errors['username'] = 'Username must be at least 3 characters';
    }

    // Email validation
    if (emailAddress.trim().isEmpty) {
      errors['email'] = 'Email is required';
    } else if (!RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(emailAddress)) {
      errors['email'] = 'Please enter a valid email address';
    }

    // Password validation
    if (password.isEmpty) {
      errors['password'] = 'Password is required';
    } else if (password.length < 8) {
      errors['password'] = 'Password must be at least 8 characters';
    }

    // Confirm password validation
    if (confirmPassword.isEmpty) {
      errors['confirmPassword'] = 'Please confirm your password';
    } else if (password != confirmPassword) {
      errors['confirmPassword'] = 'Passwords do not match';
    }

    // Terms validation
    if (!termsAccepted) {
      errors['terms'] = 'You must accept the terms and conditions';
    }

    return errors;
  }

  void resetState() {
    emit(PatientRegistrationInitial());
  }
}
