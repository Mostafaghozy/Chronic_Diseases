class PredictionResponseModel {
  final double? riskPercentage;
  final String? riskLevel;
  final String? recommendation;
  final List<String>? actions;
  final Map<String, dynamic>? additionalData;

  PredictionResponseModel({
    this.riskPercentage,
    this.riskLevel,
    this.recommendation,
    this.actions,
    this.additionalData,
  });

  factory PredictionResponseModel.fromJson(Map<String, dynamic> json) {
    // Handle the new mock response structure
    double? percentage;
    String? level;
    String? message;
    List<String>? actionList;

    if (json.containsKey('prediction_percentage')) {
      // New mock response structure
      percentage = (json['prediction_percentage'] ?? 0.0).toDouble();

      if (json['recommendation'] != null) {
        final rec = json['recommendation'] as Map<String, dynamic>;
        level = rec['risk_level'] ?? 'Unknown';
        message = rec['message'] ?? '';
        if (rec['actions'] != null) {
          actionList = List<String>.from(rec['actions']);
        }
      }
    } else {
      // Original API response structure (fallback)
      percentage = (json['risk_percentage'] ?? json['prediction'] ?? 0.0)
          .toDouble();
      level = json['risk_level'] ?? json['severity'] ?? 'Unknown';
      message = json['recommendation'] ?? json['message'] ?? '';
    }

    return PredictionResponseModel(
      riskPercentage: percentage,
      riskLevel: level,
      recommendation: message,
      actions: actionList,
      additionalData: json,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'risk_percentage': riskPercentage,
      'risk_level': riskLevel,
      'recommendation': recommendation,
      'additional_data': additionalData,
    };
  }
}
