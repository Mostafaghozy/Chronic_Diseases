import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'state.dart';
import 'prediction_request_model.dart';
import 'prediction_response_model.dart';

class CheckSymptomsCubit extends Cubit<CheckSymptomsState> {
  CheckSymptomsCubit() : super(CheckSymptomsInitial());
  Future<void> predictSymptoms(PredictionRequestModel request) async {
    emit(CheckSymptomsLoading());

    // ORIGINAL API CALL CODE - UNCOMMENT WHEN CORS IS RESOLVED
    final url = Uri.parse('http://api-ai.runasp.net/api/Prediction/predict');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final result = PredictionResponseModel.fromJson(data);
        emit(CheckSymptomsSuccess(result));
      } else {
        emit(
          CheckSymptomsError(
            'Failed to get prediction: ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      emit(CheckSymptomsError('Error: $e'));
    }
  }
}
