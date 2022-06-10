class StepModel {
  final int count;
  final DateTime timeStamp;
  final String? userName;

  StepModel({
    required this.count,
    required this.timeStamp,
    this.userName,
  });

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'date': timeStamp.toIso8601String(),
      'userName': userName,
    };
  }

  factory StepModel.fromMap(Map<String?, dynamic> map) {
    return StepModel(
      count: map['count'],
      timeStamp: DateTime.parse(map['date']),
      userName: map['userName'],
    );
  }

  StepModel copyWith({int? count, String? userName}) {
    return StepModel(
      count: count ?? this.count,
      timeStamp: timeStamp,
      userName: userName ?? this.userName,
    );
  }
}
