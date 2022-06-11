class StepModel {
  final int count;
  final DateTime timeStamp;

  StepModel({
    required this.count,
    required this.timeStamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'date': timeStamp.toIso8601String(),
    };
  }

  factory StepModel.fromMap(Map<String?, dynamic> map) {
    return StepModel(
      count: map['count'],
      timeStamp: DateTime.parse(map['date']),
    );
  }

  StepModel copyWith({
    int? count,
  }) {
    return StepModel(
      count: count ?? this.count,
      timeStamp: timeStamp,
    );
  }
}
