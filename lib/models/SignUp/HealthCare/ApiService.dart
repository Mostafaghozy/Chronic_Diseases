import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://authapifirst.runasp.net/api";

  static Future<Map<String, dynamic>> registerHealthcareProvider({
    required String username,
    required String emailAddress,
    required String password,
    required String licenseNumber,
    required String specialization,
    required String clinicOrHospital,
    required bool termsAccepted,
  }) async {
    const String endpoint = "$baseUrl/Account/register/healthcare-provider";

    final Map<String, dynamic> requestBody = {
      "username": username,
      "emailAddress": emailAddress,
      "password": password,
      "isHealthcareProvider": true,
      "providerInfo": {
        "licenseNumber": licenseNumber,
        "specialization": specialization,
        "clinicOrHospital": clinicOrHospital,
      },
      "termsAccepted": termsAccepted,
    };

    try {
      print('Sending request to: $endpoint');
      print('Request body: ${json.encode(requestBody)}');

      final response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(requestBody),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'message': responseData['message'] ?? 'User registered successfully',
          'data': responseData,
        };
      } else {
        // Handle errors array from API
        String errorMessage = responseData['message'] ?? 'Registration failed';
        if (responseData['errors'] != null) {
          if (responseData['errors'] is List &&
              responseData['errors'].isNotEmpty) {
            errorMessage = responseData['errors'][0].toString();
          } else if (responseData['errors'] is String) {
            errorMessage = responseData['errors'];
          }
        }
        return {
          'success': false,
          'message': errorMessage,
          'error': responseData,
        };
      }
    } catch (e) {
      print('API Error: $e');
      return {
        'success': false,
        'message': 'Network error occurred: ${e.toString()}',
        'error': e.toString(),
      };
    }
  }
}
