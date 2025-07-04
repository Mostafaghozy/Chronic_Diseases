import 'package:chronic_diseases/models/SignUp/HealthCare/ApiService.dart';
import 'package:chronic_diseases/models/SignUp/HealthCare/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HealthcareProviderCubit extends Cubit<HealthcareProviderState> {
  HealthcareProviderCubit() : super(HealthcareProviderInitial());

  Future<void> registerHealthcareProvider({
    required String username,
    required String emailAddress,
    required String password,
    required String licenseNumber,
    required String specialization,
    required String clinicOrHospital,
    required bool termsAccepted,
  }) async {
    emit(HealthcareProviderLoading());

    try {
      final result = await ApiService.registerHealthcareProvider(
        username: username,
        emailAddress: emailAddress,
        password: password,
        licenseNumber: licenseNumber,
        specialization: specialization,
        clinicOrHospital: clinicOrHospital,
        termsAccepted: termsAccepted,
      );

      if (result['success']) {
        emit(HealthcareProviderSuccess(message: result['message']));
      } else {
        emit(HealthcareProviderError(error: result['message']));
      }
    } catch (e) {
      emit(HealthcareProviderError(error: 'Unexpected error: ${e.toString()}'));
    }
  }
}
