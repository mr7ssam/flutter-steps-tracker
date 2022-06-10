class StepModel {
  final int count;
  final DateTime timeStamp;

  StepModel(this.count, this.timeStamp);

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'date': timeStamp.toIso8601String(),
    };
  }

  factory StepModel.fromMap(Map<String?, dynamic> map) {
    return StepModel(map['count'], DateTime.parse(map['date']));
  }

  StepModel copyWith({int? count}) {
    return StepModel(count ?? this.count, timeStamp);
  }
}
