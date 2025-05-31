class PredictionRequestModel {
  final String gender;
  final int age;
  final int hypertension;
  final int heartDisease;
  final String smokingHistory;
  final double bmi;
  final double hbA1cLevel;
  final int bloodGlucoseLevel;
  final String hypertensionActualValue;
  PredictionRequestModel({
    required this.gender,
    required this.age,
    required this.hypertension,
    required this.heartDisease,
    required this.smokingHistory,
    required this.bmi,
    required this.hbA1cLevel,
    required this.bloodGlucoseLevel,
    this.hypertensionActualValue = 'N/A',
  });

  Map<String, dynamic> toJson() {
    return {
      //make gender first letter alway capital
      'gender':
          gender.substring(0, 1).toUpperCase() +
          gender.substring(1).toLowerCase(),
      'age': age,
      'hypertension': hypertension,
      'heart_disease': heartDisease,
      'smoking_history': smokingHistory,
      'bmi': bmi,
      'HbA1c_level': hbA1cLevel,
      'blood_glucose_level': bloodGlucoseLevel,
    };
  }

  factory PredictionRequestModel.fromJson(Map<String, dynamic> json) {
    return PredictionRequestModel(
      gender: json['gender'] ?? '',
      age: json['age'] ?? 0,
      hypertension: json['hypertension'] ?? 0,
      heartDisease: json['heart_disease'] ?? 0,
      smokingHistory: json['smoking_history'] ?? '',
      bmi: (json['bmi'] ?? 0.0).toDouble(),
      hbA1cLevel: (json['HbA1c_level'] ?? 0.0).toDouble(),
      bloodGlucoseLevel: (json['blood_glucose_level'] ?? 0.0).toDouble(),
    );
  }
}
