class HealthRecordModel {
  final bool big;
  final DateTime date;
  final int points;

  HealthRecordModel({
    required this.big,
    required this.date,
    required this.points,
  });

  Map<String, dynamic> toMap() {
    return {
      'big': big,
      'date': date.toIso8601String(),
      'points': points,
    };
  }

  factory HealthRecordModel.fromMap(Map<String, dynamic> map) {
    return HealthRecordModel(
      big: map['big'] as bool,
      date: DateTime.parse(map['date']),
      points: map['points'] as int,
    );
  }
}
