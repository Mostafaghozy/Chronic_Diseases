abstract class HealthcareProviderState {}

class HealthcareProviderInitial extends HealthcareProviderState {}

class HealthcareProviderLoading extends HealthcareProviderState {}

class HealthcareProviderSuccess extends HealthcareProviderState {
  final String message;
  HealthcareProviderSuccess({required this.message});
}

class HealthcareProviderError extends HealthcareProviderState {
  final String error;
  HealthcareProviderError({required this.error});
}
