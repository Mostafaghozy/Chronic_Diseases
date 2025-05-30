class PredictionRequest {
  final String gender;
  final int age;
  final int hypertension;
  final int heartDisease;
  final String smokingHistory;
  final double bmi;
  final double hba1cLevel;
  final int bloodGlucoseLevel;

  PredictionRequest({
    required this.gender,
    required this.age,
    required this.hypertension,
    required this.heartDisease,
    required this.smokingHistory,
    required this.bmi,
    required this.hba1cLevel,
    required this.bloodGlucoseLevel,
  });

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'age': age,
      'hypertension': hypertension,
      'heart_disease': heartDisease,
      'smoking_history': smokingHistory,
      'bmi': bmi,
      'HbA1c_level': hba1cLevel,
      'blood_glucose_level': bloodGlucoseLevel,
    };
  }
}
